/**
 * @fileoverview The Class User lets you generate a random User
 * having a name, gender,  birthday, profession,country and adress (using Chance.js)
 * @author Gabrielli Alexandre
 */

const Chance = require("chance");
const chance = Chance();

class User {
  constructor() {
    this.name = chance.name({ prefix: true, gender: this.gender });
    this.birthday = chance.birthday();
    this.profession = chance.profession({ rank: true });
    this.country = chance.country({ full: true });
    this.address = chance.address({short_suffix: true});

  }

  static generate() {
    let numberOfUsers = chance.integer({
      min: 1,
      max: 10
    });

    let users = [];

    for (let i = 0; i < numberOfUsers; ++i) {
      users.push(new User());
    }

    return users;
  }
}

module.exports = {
  User
}