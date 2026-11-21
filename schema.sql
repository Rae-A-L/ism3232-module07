CREATE TABLE IF NOT EXISTS departments (
    department_id INTEGER PRIMARY KEY,
    department_name TEXT NOT NULL,
    issue_type TEXT NOT NULL
);

INSERT OR IGNORE INTO departments VALUES
(1, 'Desktop Support', 'Equipment Replacements'),
(2, 'Desktop Support', 'Hardware installation'),
(3, 'Networking', 'VPN issues'),
(4, 'Networking', 'Wi-fi Connectivity'),
(5,'Service Desk', 'Password Reset');

CREATE TABLE IF NOT EXISTS troubleshooting_guides (
    guide_id INTEGER PRIMARY KEY,
    issue_type TEXT NOT NULL,
    question TEXT NOT NULL
);

INSERT OR IGNORE INTO troubleshooting_guides VALUES
(1, 'Wi-fi connectivity', 'Can the user connect to global protect?'),
(2, 'VPN issues', 'Is the correct VPN client installed?'),
(3, 'Equipment Replacements', 'Is the current equipment damaged or not functioning?'),
(4, 'Hardware installation', 'Is the new installed hardware working properly?'),
(5, 'Password Reset', 'Has the user verified their identity?');

CREATE TABLE IF NOT EXISTS change_requests (
    request_id INTEGER PRIMARY KEY AUTOINCREMENT,
    request_type TEXT NOT NULL,
    details TEXT NOT NULL,
    status TEXT NOT NULL DEFAULT 'in progress'
);