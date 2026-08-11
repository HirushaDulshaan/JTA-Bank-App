<%@ page import="lk.jiat.ee.bank.entity.Account" %>
<%@ page import="java.util.List" %>
<%--
  Created by IntelliJ IDEA.
  User: Hirusha Dulshan
  Date: 8/11/2026
  Time: 5:01 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>JTA BANK | Dashboard</title>
    <style>
        :root {
            --primary-color: #0f172a;
            --accent-color: #2563eb;
            --accent-hover: #1d4ed8;
            --bg-color: #f8fafc;
            --card-bg: #ffffff;
            --text-main: #334155;
            --text-light: #64748b;
            --border-color: #e2e8f0;
            --success-color: #16a34a;
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
            min-height: 100vh;
        }

        /* Navigation Bar */
        nav {
            background-color: var(--primary-color);
            padding: 16px 32px;
            display: flex;
            justify-content: flex-end;
            align-items: center;
            gap: 24px;
            box-shadow: 0 4px 6px -1px rgba(0, 0, 0, 0.1);
        }

        nav a {
            color: #cbd5e1;
            text-decoration: none;
            font-size: 14px;
            font-weight: 500;
            transition: color 0.2s ease;
        }

        nav a:hover {
            color: #ffffff;
        }

        nav a.logout-btn {
            color: #fca5a5;
        }

        nav a.logout-btn:hover {
            color: #ef4444;
        }

        /* Main Container */
        .dashboard-container {
            max-width: 1000px;
            margin: 40px auto;
            padding: 0 20px;
        }

        .welcome-header {
            margin-bottom: 32px;
        }

        .welcome-header h1 {
            color: var(--primary-color);
            font-size: 28px;
            font-weight: 700;
            margin-bottom: 8px;
        }

        .welcome-header h2 {
            color: var(--text-light);
            font-size: 18px;
            font-weight: 500;
        }

        /* Empty Account State */
        .empty-state {
            background-color: var(--card-bg);
            padding: 32px;
            border-radius: 12px;
            text-align: center;
            box-shadow: 0 4px 6px -1px rgba(0, 0, 0, 0.05);
            border: 1px solid var(--border-color);
        }

        .empty-state p {
            font-size: 16px;
            color: var(--text-light);
        }

        .empty-state a {
            color: var(--accent-color);
            font-weight: 600;
            text-decoration: none;
        }

        .empty-state a:hover {
            text-decoration: underline;
        }

        /* Account Cards Grid */
        .accounts-grid {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(300px, 1fr));
            gap: 20px;
        }

        .account-card {
            background-color: var(--card-bg);
            border-radius: 12px;
            padding: 24px;
            box-shadow: 0 4px 6px -1px rgba(0, 0, 0, 0.05);
            border: 1px solid var(--border-color);
            display: flex;
            flex-direction: column;
            gap: 16px;
            transition: transform 0.2s ease, box-shadow 0.2s ease;
        }

        .account-card:hover {
            transform: translateY(-3px);
            box-shadow: 0 10px 15px -3px rgba(0, 0, 0, 0.05);
        }

        .account-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .account-type {
            font-size: 12px;
            font-weight: 700;
            text-transform: uppercase;
            letter-spacing: 0.5px;
            background-color: #eff6ff;
            color: var(--accent-color);
            padding: 4px 10px;
            border-radius: 20px;
        }

        .account-number {
            font-size: 14px;
            color: var(--text-light);
            font-family: monospace;
        }

        .account-balance {
            font-size: 24px;
            font-weight: 700;
            color: var(--success-color);
        }

        .account-actions {
            border-top: 1px solid var(--border-color);
            padding-top: 12px;
            margin-top: auto;
        }

        .account-actions a {
            color: var(--accent-color);
            text-decoration: none;
            font-size: 14px;
            font-weight: 600;
        }

        .account-actions a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>

<!-- Navigation Bar -->
<nav>
    <a href="dashboard">Dashboard</a>
    <a href="deposit.jsp">Deposit</a>
    <a href="withdraw.jsp">Withdraw</a>
    <a href="transfer.jsp">Transfer</a>
    <a href="create-account.jsp">New Account</a>
    <a href="logout" class="logout-btn">Logout</a>
</nav>

<!-- Main Container -->
<div class="dashboard-container">
    <div class="welcome-header">
        <h1>Welcome, ${sessionScope.userName} 👋</h1>
        <h2>Your Accounts</h2>
    </div>

    <%
        List<Account> accounts = (List<Account>) request.getAttribute("acconts");

        if (accounts == null || accounts.isEmpty()) {
    %>
    <div class="empty-state">
        <p>No accounts found. <a href="create-account.jsp">Create a New Account</a>.</p>
    </div>
    <% } else { %>
    <div class="accounts-grid">
        <% for (Account account : accounts) { %>
        <div class="account-card">
            <div class="account-header">
                <span class="account-type"><%= account.getAccountType() %></span>
                <span class="account-number">Acc: <%= account.getAccNo() %></span>
            </div>

            <div class="account-balance">
                $<%= String.format("%.2f", account.getBalance()) %>
            </div>

            <div class="account-actions">
                <a href="history?accNo=<%= account.getAccNo() %>">View Transaction History &rarr;</a>
            </div>
        </div>
        <% } %>
    </div>
    <% } %>
</div>

</body>
</html>