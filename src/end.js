if (typeof define === "function" && define.amd) define(scrabble);
  else if (typeof module === "object" && module.exports) module.exports = scrabble;
  this.scrabble = scrabble;
}();
