$(document).ready(function() {
  var socket = io();
  socket.emit('join', getParameterByName('gameid'));  //join room as defined by query parameter in URL bar

  var board,
  game = new Chess(),
  statusEl = $('#status'),
  fenEl = $('#fen'),
  pgnEl = $('#pgn');
  loadStatus = $('#load-status');

  var isWhite = true;
  var loaded = false, started = false, waiting = false;
  var localWhiteTime = 1800, localBlackTime = 1800;
  var lastWhiteTime, lastBlackTime, time;
  var startTime = new Date().getTime();

  // do not pick up pieces if the game is over
  // only pick up pieces for the side to move
  var onDragStart = function(source, piece, position, orientation) {

    if (!loaded && !started) return false;
    if (waiting) return false;

    if (game.game_over() === true ||
    (game.turn() === 'w' && piece.search(/^b/) !== -1) ||
    (game.turn() === 'b' && piece.search(/^w/) !== -1) ||
    game.turn() !== (isWhite ? 'w' : 'b')) {
      return false;
    }
  };

  var onDrop = function(source, target) {

    var fen = game.fen();

    // move object
    var moveObj = ({
      from: source,
      to: target,
      promotion: 'q' // NOTE: always promote to a queen for example simplicity
    });
    console.log('own move: ' + JSON.stringify(moveObj));
    // see if the move is legal
    var move = game.move(moveObj);
    // illegal move
    if (move === null) {
      return 'snapback';
    }
    socket.emit('move', moveObj, getParameterByName('gameid'), fen);
    updateStatus();
  };

  // update the board position after the piece snap
  // for castling, en passant, pawn promotion
  var onSnapEnd = function() {
    board.position(game.fen());
  };

  var updateStatus = function() {
    var status = '';

    var moveColor = 'White';
    if (game.turn() === 'b') {
      moveColor = 'Black';
    }

    // checkmate?
    if (game.in_checkmate() === true) {
      status = 'Game over, ' + moveColor + ' is in checkmate.';
    }

    // draw?
    else if (game.in_draw() === true) {
      status = 'Game over, drawn position';
    }

    // game still on
    else {
      status = moveColor + ' to move';

      // check?
      if (game.in_check() === true) {
        status += ', ' + moveColor + ' is in check';
      }
    }

    statusEl.html(status);
    fenEl.html(game.fen());
    pgnEl.html(game.pgn());

    //  var gameState = {fen: "", move: "", turn: isWhite ? "white" : "black"};

    socket.on('sync', function(gameState) {

      if (waiting) {
        loadStatus.html('Waiting for Opponent..');
      } else {
        loadStatus.html('Loading..');
      }

      $('#loading').slideDown();

      board.orientation(gameState.player);
      if (game.fen().toString() != gameState.fen.toString()) {
        game.load(gameState.fen);
        board.position(game.fen(),false);
        waiting = false; // in case we get a sync event for loading before opponent connects
      }

      started = gameState.started;
      if (!started && !waiting) {
        loadStatus.html('Waiting for Opponent..');
        $('#loading').slideDown();
        waiting = true;
      }

      if (started) {
        waiting = false;
        $('#loading').slideUp();
      }

      if (gameState.whitetime && gameState.blacktime) {
        updateTime(gameState.whitetime, gameState.blacktime);
      }

      isWhite = gameState.player && gameState.player == "white";
      loaded = true;
      updateStatus();
    });

    socket.on('move', function(moveObj) { // remote move by peer
      console.log('peer move: ' + JSON.stringify(moveObj));
      var move = game.move(moveObj);
      // illegal move
      if (move === null) {
        return;
      }
      board.position(game.fen());
      updateStatus();
    });
  };

  var cfg = {
    draggable: true,
    position: 'start',
    onDragStart: onDragStart,
    onDrop: onDrop,
    onSnapEnd: onSnapEnd
  };
  board = ChessBoard('board', cfg);

  socket.on('log', function(msgObj) {
    console.log('server msg: ' + JSON.stringify(msgObj));
  });

  socket.on('heartbeat', function() {
    socket.emit('heartbeat', getParameterByName('gameid'));
  });

  socket.on('timer', function(serverWhiteTime, serverBlackTime){
    updateTime(serverWhiteTime, serverBlackTime);
  });

  function updateTime(whiteTime, blackTime) {

    startTime = new Date().getTime();

    localWhiteTime = whiteTime;
    localBlackTime = blackTime;

    function formatTime(t) {
      var minutes, seconds;
      seconds = t % 60;
      minutes = Math.floor(t / 60) % 60;
      return "" + minutes + ":" + (pad(seconds));
    };

    function pad(x) {
      return ('0' + x).slice(-2);
    };

    document.getElementById("whiteTime").innerHTML = formatTime(whiteTime);
    document.getElementById("blackTime").innerHTML = formatTime(blackTime);
  };

  setInterval(function() {

    if (!started) return;

    time = Math.round((new Date().getTime() - startTime) / 1000);
    // time elapsed since the time was last updated on the client

    console.log(time);

    if(game.turn() == 'w') {
      localWhiteTime -= time;
    } else {
      localBlackTime -= time;
    }
    updateTime(localWhiteTime, localBlackTime);
  }, 1000);

  $('form').submit(function(){
    socket.emit('chat message', $('#m').val(), getParameterByName('gameid'));
    $('#m').val('');
    return false;
  });

  socket.on('chat message', function(msg, gameid){
    $('#messages').prepend($('<li>').text(gameid + ': ' + msg));
  });


  updateStatus();
});
