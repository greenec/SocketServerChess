// mysql root pass: catalyst7!
var express = require('express');
var app = express();
var socketIO = require('socket.io');
var LEX = require('letsencrypt-express');
var https = require('https');
var mysql = require('mysql');
var sql = require('squel');
var Chess = require('chess.js').Chess;

var lex = LEX.create({
  configDir: '/etc/letsencrypt',
  letsencrypt: null,
  approveRegistration: function (hostname, cb) {
    cb(null, {
      domains: ['chessmatch.us', 'www.chessmatch.us'],
      email: 'connor.greene2000@gmail.com',
      agreeTos: true
    });
  }
});

var server = https.createServer(lex.httpsOptions, LEX.createAcmeResponder(lex, app));
server.listen(443);

var io = socketIO.listen(server);

function getRoomKey (white_key, black_key) {
  var sha1 = require('sha1');
  return sha1(white_key + black_key);
}

app.use(express.static(__dirname + '/static/'));

app.get('/', function (req, res) { // host client @ base url
  res.render('index.html')
});

var connection = mysql.createConnection({
  host	: 'localhost',
  user	: 'root',
  password: 'catalyst7!',
  database: 'chess'
});

connection.connect();

io.on('connection', function(socket) { //join room on connect
  socket.on('join', function(room) {
    //socket.join(room);

    var query = sql.select().from("games").where("black_key = ? OR white_key = ?", room, room).toString();

    connection.query(query, function(err, rows, fields) {
      if (!err && rows && rows.length > 0) {
        var roomkey = getRoomKey(rows[0].white_key, rows[0].black_key);
        var players = { white: rows[0].white_key.toString(), black: rows[0].black_key.toString()};
        var isWhite = room.toString() === players.white.toString();
        var otherRoom = (isWhite ? players.black.toString() : players.white.toString());
        var isStarted = isWhite ? rows[0].blackpresent == 1 : rows[0].whitepresent == 1;
        var whiteTime = rows[0].whitetime, blackTime = rows[0].blacktime;

        socket.join(room); // Join room based on matchcode
        socket.join(roomkey);  // Join room based on roomkey

        var queryjoin = sql.update().table("games").set(isWhite ? "whitepresent" : "blackpresent", 1).where("gameid = ?", rows[0].gameid);

        // Only true if one player is not here
        if (rows[0].blackpresent != rows[0].whitepresent)
        {
          if (isWhite && rows[0].whitepresent == 0) {
            queryjoin.set("starttime", "now()");
          } else if (!isWhite && rows[0].blackpresent == 0) {
            queryjoin.set("starttime", "now()");
          }

        }

        var qjoin = queryjoin.toString();

        // Join query
        connection.query(qjoin, function(err3, rows3, fields3) {
          console.log("Join logged for " + (isWhite ? "white" : "black") + "..");

          var querymoves = sql.select()
          .field("UNIX_TIMESTAMP(NOW())- UNIX_TIMESTAMP(created) AS movetime")
          .field("moves.*")
          .from("moves")
          .where("gameid = ?", rows[0].gameid)
          .order("moveid", false).toString();

          connection.query(querymoves, function(err2, rows2, fields2) {

            var game = new Chess();
            game.reset();

            var gameState = {fen: game.fen().toString(), move: "", turn: "white", player: isWhite ? "white" : "black", started: isStarted, 'blacktime' : blackTime, 'whitetime': whiteTime};

            if (!err2 && rows2 && rows2.length > 0) {
              gameState.fen = rows2[0].fen.toString();

              if (rows2[0].player_key.toString() === room.toString()) {
                gameState.turn = isWhite ? 'black' : 'white';
              } else {
                gameState.turn = isWhite ? 'white' : 'black';
              }

              // console.log("white time: " + gameState.whitetime + ", black time: " + gameState.blacktime + ", elapsed since last move: " + rows2['movetime']);
              if (gameState.turn == 'white') {
                gameState.whitetime -= rows2[0].movetime;
              } else {
                gameState.blacktime -= rows2[0].movetime;
              }

            }

            io.to(room).emit('sync', gameState);

            gameState.player = isWhite ? "black" : "white";
            io.to(otherRoom).emit('sync', gameState);

          });

        }); // End join query

        console.log('user ' + room + ' joined room: ' + roomkey);
      }
    });

  });

  socket.on('move', function(move, match_code, fen) { //move object emitter
    console.log('user moved: ' + JSON.stringify(move));
    match_code = match_code.toString();

    var query = sql.select().from("games").where("black_key = ? OR white_key = ?", match_code, match_code).toString();
    var players = { white: "", black: ""};
    var game = new Chess();

    connection.query(query, function(err, rows, fields) {
      if (!err) {
        if (rows && rows.length > 0) {
          players.black = new String(rows[0].black_key.toString());
          players.white = new String(rows[0].white_key.toString());
          //io.to(match_code).emit('log', game);

          // First let's figure out the color of the player and their room key
          var isWhite = match_code === players.white.toString();
          var roomkey = getRoomKey(rows[0].white_key, rows[0].black_key);
          var whiteTime = rows[0].whitetime, blackTime = rows[0].blacktime;

          console.log(match_code + ", " + players.black);
          //var turn = fen.charAt(fen.indexOf(" ") + 1);

          // Build a query to get their moves list
          var querymoves = sql.select()
          .field("UNIX_TIMESTAMP(NOW())- UNIX_TIMESTAMP(created) AS movetime")
          .field("moves.*")
          .from("moves")
          .where("gameid = ?", rows[0].gameid)
          .order("moveid", false).toString();


          //console.log(rows);
          console.log(querymoves);

          connection.query(querymoves, function(err2, rows2, fields2) {

            var gameState = {fen: "", move: "", turn: isWhite ? "white" : ", black", blacktime : blackTime, whitetime: whiteTime};

            var valid = true;

            if (!err2 && rows2 && rows2.length > 0) {

              gameState.fen = rows2[0].fen.toString();

              console.log(rows2[0]);

              if (rows2[0].player_key == players.white) { // White was last to move
                gameState.blacktime = gameState.blacktime - parseInt(rows2[0].movetime) + 1;
                blackTime = gameState.blacktime;
              } else {
                gameState.whitetime = gameState.whitetime - parseInt(rows2[0].movetime) + 1;
                whiteTime -= gameState.whitetime;
              }

              if (rows2[0].player_key == match_code) {
                // Not your turn!  You were the last person to move..
                console.log("Client attempted to move opponents pieces");
                valid = false;
                game.load(rows2[0].fen);
                gameState.fen = game.fen().toString();
                gameState.move = "";
              } else {

                console.log("Validating reported board position");

                // It is your turn!  First let's make sure client has correct board position
                if (game.validate_fen(fen).valid && rows2[0].fen.toString() === fen.toString()) {

                  // Do nothing?  valid=true
                  gameState.fen = fen;

                } else {
                  console.log ("Unable to validate client side fen string\n\tClient: " + fen + "\n\tServer: " + rows2[0].fen.toString());
                  // some code here
                  game.load(rows2[0].fen);
                  gameState.fen = game.fen().toString();
                  valid = false;
                }
              }
            } else {
              gameState.fen = game.fen().toString();
            }

            console.log("valid move? " + valid);

            if (valid) {

              game.load(gameState.fen);

              console.log("Validating: " + move);
              var nmove = game.move(move);

              console.log("Current fen: " + fen);

              // illegal move
              if (nmove === null) {
                valid = false;
              } else {
                gameState.fen = game.fen().toString();
                gameState.move = move;
                console.log("new fen: " + gameState.fen);
              }

              if (valid) {
                // Save the move
                var moveq = sql.insert().into("moves")
                .set("player_key", match_code.toString())
                .set("fen", gameState.fen.toString())
                .set("gameid", parseInt(rows[0].gameid))
                .set("move", JSON.stringify(gameState.move))
                .toString();

                console.log(moveq);

                connection.query(moveq, function(err,res) {
                  if(err) throw err;
                });

                var querytime = sql.update().table("games").set("whitetime", gameState.whitetime).set("blacktime", gameState.blacktime).where("gameid = ?", rows[0].gameid);

                connection.query(querytime.toString(), function(err,res) {
                  if(err) throw err;
                });

              } // if valid

            } else {
              // Sync the client with the old board position
              gameState.fen = rows2[0].fen; // This is the fen board position they should have
              io.to(match_code).emit('sync', gameState);
            }
            console.log(rows2);

            if (valid) {
              io.to(roomkey).emit('move', move);
            }

          });

          if (isWhite) {
            io.to(match_code).emit('log', 'You are white');
          } else {
            io.to(match_code).emit('log', 'You are black');
          }

        }

      } else {
        io.to(roomkey).emit('log', err);
      }
    });
  });

  // Basic code for recieving a player lineup,
  // where 'lineup' is an array.
  socket.on('lineup', function(lineup){
    console.log(lineup);
  });

  socket.on('timer', function(time, turn){
    function pad(x) {
      return ('0' + x).slice(-2);
    }
    function formatTime(t) {
      var minutes, seconds;
      seconds = t % 60;
      minutes = Math.floor(t / 60) % 60;
      return minutes + ":" + pad(seconds);
    }
    console.log("Player " + (turn + 1) + ": " + formatTime(time));
  });

  socket.on('disconnect', function() {
    io.emit('heartbeat');
    console.log("Player disconnected.")
  });

  socket.on('heartbeat', function(gameid) {
    console.log(gameid + " is still connected.");
  });

  socket.on('chat message', function(msg, match_code) {
    var query = sql.select().from("games").where("black_key = ? OR white_key = ?", match_code, match_code).toString();

    connection.query(query, function(err, rows, fields) {
      if (!err && rows && rows.length > 0) {
        var roomkey = getRoomKey(rows[0].white_key, rows[0].black_key);
        io.to(roomkey).emit('chat message', msg, match_code);
      }
    });
  });

});
