const express = require("express");
const cors = require("cors");
const bodyParser = require("body-parser");

const app = express();
app.use(cors());
app.use(bodyParser.json());

// Dummy users database
const users = {
    official: { admin: "12345" },
    public: { user: "password" }
};

app.post("/login", (req, res) => {
    const { username, password, userType } = req.body;

    if (users[userType] && users[userType][username] === password) {
        res.json({ success: true });
    } else {
        res.json({ success: false, message: "Invalid username or password" });
    }
});

app.get("/dashboard", (req, res) => {
    const userType = req.query.user;
    res.send(`<h1>Welcome to Smart Panchayat ${userType === 'official' ? 'Official' : 'Public'} Dashboard</h1>`);
});

app.listen(3000, () => console.log("Server running on port 3000"));
