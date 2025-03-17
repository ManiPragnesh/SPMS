function loginUser(event) {
    event.preventDefault(); // Prevent page reload

    // Hardcoded Credentials (Replace with Database Later)
    const username = document.getElementById("username").value;
    const password = document.getElementById("password").value;

    if (username === "admin" && password === "1234") {
        alert("Login Successful!");
        localStorage.setItem("loggedIn", "true"); // Store session
        window.location.href = "dashboard.html"; // Redirect to Dashboard
    } else {
        document.getElementById("error-message").innerText = "Invalid Credentials!";
    } 
}

// Logout Function
function logout() {
    localStorage.removeItem("loggedIn");
    window.location.href = "login.html";
}

// Redirect if Not Logged In
if (window.location.pathname.includes("dashboard.html") && !localStorage.getItem("loggedIn")) {
    window.location.href = "login.html";
}
