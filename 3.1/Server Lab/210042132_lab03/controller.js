const path = require('path');
const bcrypt = require('bcrypt');
const passport = require('passport');
const fs = require('fs');

const users = path.join(__dirname, 'user.json');

const readUsers = () => {
    try {
        const data = fs.readFileSync(users, 'utf8'); 
        return JSON.parse(data); 
    } catch (error) {
        console.error("Error reading users from JSON file:", error);
        return []; 
    }
};




const initializePassport = require('./passport.js');
initializePassport(
    passport,
    email => readUsers().find(user => user.email === email),
    id => readUsers().find(user => user.id === id)
);

const getLogin = (req, res) => {
    const filePath = path.join(__dirname, 'views', 'login.html');
    res.sendFile(filePath);
};

const getRegister = (req, res) => {
    const filePath = path.join(__dirname, 'views', 'register.html');
    res.sendFile(filePath);
};

const postRegister = async (req, res, next) => {
    try {
        const hashedPassword = await bcrypt.hash(req.body.password, 10);

        const newUser = {
            id: Date.now().toString(), 
            name: req.body.username,
            email: req.body.email,
            password: hashedPassword,
        };

        const usersArray = readUsers(); 
        usersArray.push(newUser); 

        fs.writeFileSync(users, JSON.stringify(usersArray, null, 2), 'utf8'); 

        res.redirect('/login');
    } catch (error) {
        console.error("Error during registration:", error);
        res.redirect('/register');
    }
};


const postLogin = (req, res, next) => {
    passport.authenticate('local', {
        successRedirect: '/welcome',
        failureRedirect: '/login',
        failureFlash: true,
    })(req, res, next);
};

module.exports = { getLogin, postLogin, getRegister, postRegister };
