select *
from order_item orderItem 
inner join cart_item cartItem on orderItem.item_id=cartItem.id 
inner join article article1 on cartItem.article_id=article1.id 
inner join article article2 on cartItem.article_id=article2.id 
left outer join book book on article2.id=book.id 
where book.title='teste1';

INSERT INTO demo.article
(a_base_property)
VALUES('prop2');

select * from demo.article a;

INSERT INTO demo.book
(title, id)
VALUES('teste2', 2);

select * from book;

INSERT INTO demo.cart_item
(article_id)
VALUES(2);

select * from cart_item;

INSERT INTO demo.order_item
(item_id)
VALUES(2);



select * from SharedAccountAccount s
INSERT INTO blazon.SharedAccountAccount
(id, accountIdentifier, directoryIdentifier, resourceId, resourceName)
VALUES(6, null, 129, 25, 'Ldap A3');

INSERT INTO blazon.SharedAccountUser
(id, directoryIdentifier, displayName, username)
VALUES(6, 1, 'Marcos Silva', 'teste');

INSERT INTO blazon.RemoveSharedAccountMembershipEntry
(createdAt, removeMembership, resolveNote, resolvedAt, status, account_id, member_id, resolvedBy_id)
VALUES('2020-02-13 14:26:42', null, null, null, 'WAITING_RESOLUTION', 6, 6, null);

-----------------------

select count(task.id) as amount
from Task task 
join UserTask recipient on recipient.id = task.recipient_id
join TaskQueue_Task taskOnQueue on taskOnQueue.tasks_id = task.id
join TaskQueue queue on queue.id = taskOnQueue.TaskQueue_id
where recipient.directoryIdentifier = 1
and queue.id = 1;


select count(task.id) as amount
from Task task 
join TaskQueue_Task taskOnQueue on taskOnQueue.tasks_id = task.id
where taskOnQueue.TaskQueue_id = 1;

select * from TaskQueue t;

select * from  TaskQueue_Task;

insert into TaskQueue_Task values(1, 320);

select * from Task;

-----------------


SELECT * 
FROM Task t 
JOIN TaskDefinition taskDefinition on t.definition_id = taskDefinition.id 
JOIN TaskQueue_Task tt ON t.id = tt.tasks_id 
LEFT JOIN UserTask requester ON t.requester_id = requester.id
LEFT JOIN UserTask recipient ON t.recipient_id = recipient.id
WHERE tt.TaskQueue_id = 1
ORDER BY t.id
LIMIT 10 OFFSET 0; 
					
					
