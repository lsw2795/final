select *from confirm;
select *from document_form;
select * from employee;
select * from dept;
select * from position;
select * from confirmline;
select * from confirm_file;
select * from deptagree;
select * from state;
select * from refer;
select * from confirmsview;
select * from confirm_file;

where confirm_document_no in
(
select confirm_document_no from refer
where emp_no=4
);

delete from refer
where confirm_document_no like '230815%';

commit;

update confirm
set confirm_state = 1
where confirm_document_no='230819-1-2';

select confirm1 from confirmline
where confirm_line_no in (select confirm_line_no from confirm
                            where confirm_document_no='230818-1-1');

delete from refer
where refer_no=12;

select emp_no from refer
where confirm_document_no='230818-1-1';

delete from confirm_file
where confirm_file_no=9;

insert into state
VALUES(state_seq.nextval,'완료');

select sysdate from dual; 

update employee
set dept_No = 1
where emp_No = 1;

update employee
set position_No = 1
where emp_No = 1;

insert into position
VALUES(position_seq.nextval,'황재구',1);

insert into document_form
VALUES(document_form_seq.nextval,'사직서','1','1');

insert into dept
VALUES(dept_seq.nextval,'김채영부서',1,1,1);

delete from confirm
where confirm_title='휴가신청';

select count(*) from confirm
where create_date=sysdate;

create or replace view confirmlineView
as
select c.*,e.name as confirm1name, e2.name as confirm2name, e3.name as confirm3name from
confirmline c join employee e
on c.confirm1 = e.emp_no
join employee e2
on c.confirm2 = e2.emp_no
join employee e3
on c.confirm3 = e3.emp_no;

create or replace view confirmsView
as
select c.*,e.name,e.image,d.form_name,d.security_level,d.deadline,s.state,e2.name as confirm1name,e3.name as confirm2name,e4.name as confirm3name from
confirm c join employee e
on c.emp_no = e.emp_no
join employee e2
on c.confirm1 = e2.emp_no
join employee e3
on c.confirm2 = e3.emp_no
join employee e4
on c.confirm3 = e4.emp_no
join document_form d
on c.document_no=d.document_no
join state s
on c.confirm_state=s.state_no;

select c.*,e.name,e.image from
confirm c join employee e
on c.emp_no = e.emp_no;

create or replace view confirmagreeView
as
select c.*,f.form_name,e.name, a.agreement_state,d.dept_no, d.name as deptname, d.manager, e2.name as managername, s.state from
confirm c join deptagree a
on c.confirm_document_no = a.confirm_document_no
join employee e
on e.emp_no = c.emp_no
join document_form f
on c.document_no=f.document_no
join dept d
on a.dept_no=d.dept_no
join employee e2
on e2.emp_no = d.manager
join state s
on c.confirm_state= s.state_no
order by a.agreement_state, c.confirm_document_no desc;

select*from confirmagreeview
where manager = 1;

select * from confirmagreeview;
where confirm_document_no = '230818-1-2';

select * from confirm
where
(select manager from confirmagreeview
where confirm_document_no='230820-37-6')=1
and confirm_document_no='230820-37-6';

select manger from confirmagreeview;

select * from confirmsview
order by confirm_state,create_date desc;

select * from organizationchartview;

select * from confirmsview;
where (confirm1 = 1 and (confirm_state = 1 or confirm_state = 2)) 
or (confirm2 = 1 and (confirm_state = 3 or confirm_state = 4))
or (confirm3 = 1 and (confirm_state = 5 or confirm_state = 6))
or (manager = 1 and (confirm_state = 7 or confirm_state = 8));










select c.*,e.name,e.image,d.form_name,d.security_level,d.deadline from
confirm c join employee e
on c.emp_no = e.emp_no
join document_form d
on c.document_no=d.document_no
where trunc(c.create_date)='2023-08-17'
order by confirm_document_no desc;


select * from confirmlineview;
select * from
(
    select rownum as num, A.* from
    (
        select confirmsview.* from confirmsview
    )A
)
where num>=0
and num<=10;

rollback;
commit;
