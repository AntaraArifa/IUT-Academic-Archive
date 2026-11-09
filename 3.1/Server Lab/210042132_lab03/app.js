const express = require('express');
const app = express();
const cookieParser = require('cookie-parser');
const session = require('express-session');
const passport = require('passport');
const cors = require('cors');
const routes = require('./routes');
const ensureAuthenticated = require('./middleware');

app.use(express.urlencoded({ extended: true })); 
app.use(express.json());

app.use(
    session({
        secret: 'secret',
        resave: false,
        saveUninitialized: false,
    })
);
app.use(passport.initialize());
app.use(passport.session());
app.use(cookieParser());
app.use(
    cors({
        origin: 'http://localhost:3000',
        credentials: true,
    })
);

app.use(routes);

app.get('/welcome', ensureAuthenticated, (req, res) => {
    res.sendFile(__dirname + '/views/homePage.html');
});

app.listen(3000, () => {
    console.log("Server is running on http://localhost:3000");
});