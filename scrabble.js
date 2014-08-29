!function() {
  var scrabble = {
    version: "1.0.00"
  };
  if (typeof define === "function" && define.amd) {
    define(scrabble);
  } else if (typeof module === "object" && module.exports) {
    module.exports = scrabble;
    this.scrabble = scrabble;
  }
}();