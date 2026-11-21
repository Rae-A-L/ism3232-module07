# Capstone Proposal: IT Ticket Cordinator
Author: Rae Anthony Lewis 

## The business
  It serves people who are in IT departments who mainly focus on tickets. Today, IT departments tend to get confused on where to assign the ticket based off of the issue. The employees would write the issues a user has, and it will ask troubleshoot questions and refer the ticket to the best department if all fails

## Who uses it 
(the chat: employees the Staff tab: IT staff)

## Tables                          -> Week 13 schema.sql
<table>: <column> <TYPE>, ...       (one example row each; include change_requests)

departments: department_name TEXT NOT NULL, issue_types TEXT NOT NULL
('Desktop Support', 'Hardware,software,printers')

tickets: ticket_id INTEGER PRIMARY KEY, issue_description TEXT NOT NULL, assigned_department TEXT NOT NULL, status TEXT NOT NULL
(100, 'Mouse and keyboard not working', 'Desktop Support', 'Open') 

change requests: request_Id INTEGER PRIMARY KEY AUTO INCREMENT,  issue_description TEXT NOT NULL, reccommended_department TEXT NOT NULL status TEXT NOT NULL DEFAULT 'in progress'

(2, 'User cannot connect to printer', 'Networking', 'in progress')

## Lookup tools (at least two)     -> Week 14 tools.py
<name>(<arguments>): what it reads. Example question: "..."

find_department(issue_type): it looks up which department does this issue. EX. "If a user is having printer problems, who is responsible for that?"

get_troubleshooting_steps(issue_type): Looks up basic troubleshooting questions for issue. EX. "What would I do if user's mouse/keyboard doesn't work?"

## Change tool (at least one)      -> Week 14 tools.py, Week 15 Staff tab
<name>(<arguments>): what staff approve, and what approving changes

request_ticket_assignment(issue_description, department). Approving makes the request approved and assigns the ticket to the specified department.

## Handoff rule                    -> Week 14 agent.py (HANDOFF_WORDS)

Words: Account locked, password reset   Why a person must handle these: It requires verification and permissions.

## Data it never stores            (and never sends to the model)
Passwords
## Instructions draft              -> Week 14 settings.py
The facts the model may state, ending with:

You are Techbot, an IT support ticket cordinator for Tech solutions.

Answer in one short paragraph.

Ask troubleshooting questions when there is not enough information to pick the right department.

Only state facts that are in tool results or instructions

If you do not know, ask them to contact IT staff member 

If you do not know, say you do not know and ask for more information.

## Five sample conversations       -> Week 16 evaluation.py CASES
1. Customer: "..."   Must: use <tool> / hand off / say "..." / never say "..." / file <n> change(s)

1.Service Desk: "Multiple users cannot connect to VPN" Must: use find_department
2.Service Desk: "Users monitor isn't turning on." Must: use get_troubleshooting_steps.
3.Service Desk: "The users computer isnt working" Must: ask for more information
4.Service Desk: "Reset the users password" Must: hand off; never say password was reset
5.Service Desk: "Assign this VPN issue to Networking." Must: file 1 change
## Out of scope (at least two)
Making changes to tickets  without verification
Resetting Passwords 

## Checklist                       (the eight items, ticked before sign-off)

1.(*) One business. The chat serves Service Desk staff; the Staff tab serves IT administrators.
 2.(*) At least two business tables plus a change_requests table.
 3.(*) At least two lookup tools. They only read, and they check their arguments.
 4.(*) At least one change tool. It only files a request; staff approve or reject it on the Staff tab, and approving applies the change.
 5.(*)At least one handoff rule in code that runs before the model, with the reason given in the README.
 6.(*) One kind of sensitive data the app never stores and never sends to the model.
 7.(*) Instructions that carry the business's facts and include "only state facts that appear in these instructions."
 8.(*) Five sample conversations, which become the Week 16 evaluation cases.