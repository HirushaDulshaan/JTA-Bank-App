<%--
  Created by IntelliJ IDEA.
  User: Hirusha Dulshan
  Date: 8/11/2026
  Time: 3:57 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Register To JTA Bank</title>
    <style>
        :root {
            --primary-color: #0f172a;
            --accent-color: #2563eb;
            --accent-hover: #1d4ed8;
            --error-color: #dc2626;
            --error-bg: #fee2e2;
            --bg-color: #f8fafc;
            --card-bg: #ffffff;
            --text-main: #334155;
            --text-light: #64748b;
            --border-color: #cbd5e1;
        }

        * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }

        body {
            background-color: var(--bg-color);
            color: var(--text-main);
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
        }

        .register-container {
            background-color: var(--card-bg);
            padding: 40px;
            border-radius: 12px;
            box-shadow: 0 10px 25px -5px rgba(0, 0, 0, 0.05), 0 8px 10px -6px rgba(0, 0, 0, 0.05);
            width: 100%;
            max-width: 420px;
        }

        h1 {
            color: var(--primary-color);
            font-size: 24px;
            font-weight: 700;
            margin-bottom: 24px;
            text-align: center;
        }

        /* Error styling matching your request attribute logic */
        .error-message {
            background-color: var(--error-bg);
            color: var(--error-color);
            padding: 12px;
            border-radius: 6px;
            font-size: 14px;
            margin-bottom: 20px;
            border-left: 4px solid var(--error-color);
            text-align: center;
        }

        form {
            display: flex;
            flex-direction: column;
            gap: 16px;
        }

        .form-group {
            display: flex;
            flex-direction: column;
            gap: 6px;
        }

        label {
            font-size: 14px;
            font-weight: 600;
            color: var(--text-main);
        }

        input[type="text"],
        input[type="email"],
        input[type="password"] {
            width: 100%;
            padding: 12px 14px;
            border: 1px solid var(--border-color);
            border-radius: 6px;
            font-size: 14px;
            transition: all 0.2s ease-in-out;
            outline: none;
        }

        input:focus {
            border-color: var(--accent-color);
            box-shadow: 0 0 0 3px rgba(37, 99, 235, 0.15);
        }

        button[type="submit"] {
            background-color: var(--accent-color);
            color: white;
            border: none;
            border-radius: 6px;
            padding: 12px;
            font-size: 16px;
            font-weight: 600;
            cursor: pointer;
            transition: background-color 0.2s ease;
            margin-top: 8px;
        }

        button[type="submit"]:hover {
            background-color: var(--accent-hover);
        }

        .login-redirect {
            margin-top: 24px;
            text-align: center;
            font-size: 14px;
            color: var(--text-light);
        }

        .login-redirect a {
            color: var(--accent-color);
            text-decoration: none;
            font-weight: 600;
        }

        .login-redirect a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>

<div class="register-container">
    <h1>Create New Account</h1>

    <% if (request.getAttribute("error") != null){ %>
    <div class="error-message">
        <%= request.getAttribute("error") %>
    </div>
    <% } %>

    <form action="register" method="post">
        <div class="form-group">
            <label for="name">Please Enter your Name</label>
            <input type="text" id="name" name="name" placeholder="John Doe" required>
        </div>

        <div class="form-group">
            <label for="email">Please Enter your Email</label>
            <input type="email" id="email" name="email" placeholder="john@example.com" required>
        </div>

        <div class="form-group">
            <label for="password">Please Enter your Password</label>
            <input type="password" id="password" name="password" placeholder="••••••••" required>
        </div>

        <button type="submit">Register</button>
    </form>

    <div class="login-redirect">
        <p>Already Have An account? <a href="login.jsp">Go to Login</a></p>
    </div>
</div>

</body>
</html>