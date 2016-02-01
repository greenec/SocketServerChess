(function() {
  jQuery(function($) {
    var addedTimePerMove, formatTime, initialTime, intervalId, pad, remainingTime, switchTurn, turn, update;
    var socket = io();
    initialTime = 10 * 60;
    addedTimePerMove = 2;
    turn = 0;
    remainingTime = [initialTime, initialTime];
    pad = function(x) {
      return ('0' + x).slice(-2);
    };
    formatTime = function(t) {
      var hours, minutes, seconds;
      seconds = t % 60;
      minutes = Math.floor(t / 60) % 60;
      hours = Math.floor(t / 3600);
      if (hours) {
        return "" + hours + ":" + (pad(minutes)) + ":" + (pad(seconds));
      } else {
        return "" + minutes + ":" + (pad(seconds));
      }
    };
    update = function() {
      remainingTime[turn]--;
      for (var i = 0; i < 2; i++) {
        $("#time" + i).text(formatTime(remainingTime[i]));
      }
      if (remainingTime[turn] <= 0) {
        $("#time" + turn).removeClass('turn').addClass('loser');
        return clearInterval(intervalId);
      }
      socket.emit('timer', remainingTime[turn], turn);
    };
    switchTurn = function() {
      if (intervalId) {
        $("#time" + turn).removeClass('turn');
        turn = 1 - turn;
        $("#time" + turn).addClass('turn');
        return remainingTime[turn] += addedTimePerMove;
      }
    };
    $('body').mousedown(function(event) {
      switchTurn();
      return false;
    });
    $('body').keydown(function(event) {
      if (event.keyCode === 32) {
        switchTurn();
        return false;
      }
    });
    $('#time0').addClass('turn');
    return intervalId = setInterval(update, 1000);
  });
}).call(this);
