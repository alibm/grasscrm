CREATE SEQUENCE hibernate_sequence
  INCREMENT 1
  MINVALUE 1
  MAXVALUE 9223372036854775807
  START 1
  CACHE 1;
ALTER TABLE hibernate_sequence
  OWNER TO postgres;

CREATE TABLE accounttype
(
  id integer NOT NULL,
  name character varying(50) NOT NULL,
  label_en_us character varying(50),
  label_zh_cn character varying(50),
  sequence integer,
  CONSTRAINT accounttype_pkey PRIMARY KEY (id )
)
WITH (
  OIDS=FALSE
);
ALTER TABLE accounttype
  OWNER TO postgres;
  
CREATE TABLE calldirection
(
  id integer NOT NULL,
  name character varying(50) NOT NULL,
  label_en_us character varying(50),
  label_zh_cn character varying(50),
  sequence integer,
  CONSTRAINT calldirection_pkey PRIMARY KEY (id )
)
WITH (
  OIDS=FALSE
);
ALTER TABLE calldirection
  OWNER TO postgres;
  
CREATE TABLE callstatus
(
  id integer NOT NULL,
  name character varying(50) NOT NULL,
  label_en_us character varying(50),
  label_zh_cn character varying(50),
  sequence integer,
  CONSTRAINT callstatus_pkey PRIMARY KEY (id )
)
WITH (
  OIDS=FALSE
);
ALTER TABLE callstatus
  OWNER TO postgres;

CREATE TABLE campaignstatus
(
  id integer NOT NULL,
  name character varying(50) NOT NULL,
  label_en_us character varying(50),
  label_zh_cn character varying(50),
  sequence integer,
  CONSTRAINT campaignstatus_pkey PRIMARY KEY (id )
)
WITH (
  OIDS=FALSE
);
ALTER TABLE campaignstatus
  OWNER TO postgres;
  
CREATE TABLE campaigntype
(
  id integer NOT NULL,
  name character varying(50) NOT NULL,
  label_en_us character varying(50),
  label_zh_cn character varying(50),
  sequence integer,
  CONSTRAINT campaigntype_pkey PRIMARY KEY (id )
)
WITH (
  OIDS=FALSE
);
ALTER TABLE campaigntype
  OWNER TO postgres;
  
CREATE TABLE caseorigin
(
  id integer NOT NULL,
  name character varying(50) NOT NULL,
  label_en_us character varying(50),
  label_zh_cn character varying(50),
  sequence integer,
  CONSTRAINT caseorigin_pkey PRIMARY KEY (id )
)
WITH (
  OIDS=FALSE
);
ALTER TABLE caseorigin
  OWNER TO postgres;
  
CREATE TABLE casepriority
(
  id integer NOT NULL,
  name character varying(50) NOT NULL,
  label_en_us character varying(50),
  label_zh_cn character varying(50),
  sequence integer,
  CONSTRAINT casepriority_pkey PRIMARY KEY (id )
)
WITH (
  OIDS=FALSE
);
ALTER TABLE casepriority
  OWNER TO postgres;
  
CREATE TABLE casereason
(
  id integer NOT NULL,
  name character varying(50) NOT NULL,
  label_en_us character varying(50),
  label_zh_cn character varying(50),
  sequence integer,
  CONSTRAINT casereason_pkey PRIMARY KEY (id )
)
WITH (
  OIDS=FALSE
);
ALTER TABLE casereason
  OWNER TO postgres;

CREATE TABLE casestatus
(
  id integer NOT NULL,
  name character varying(50) NOT NULL,
  label_en_us character varying(50),
  label_zh_cn character varying(50),
  sequence integer,
  CONSTRAINT casestatus_pkey PRIMARY KEY (id )
)
WITH (
  OIDS=FALSE
);
ALTER TABLE casestatus
  OWNER TO postgres;

CREATE TABLE casetype
(
  id integer NOT NULL,
  name character varying(50) NOT NULL,
  label_en_us character varying(50),
  label_zh_cn character varying(50),
  sequence integer,
  CONSTRAINT casetype_pkey PRIMARY KEY (id )
)
WITH (
  OIDS=FALSE
);
ALTER TABLE casetype
  OWNER TO postgres;

CREATE TABLE currency
(
  id integer NOT NULL,
  name character varying(255) NOT NULL,
  code character varying(255),
  rate double precision,
  symbol character varying(255),
  status character varying(255),
  CONSTRAINT currency_pkey PRIMARY KEY (id )
)
WITH (
  OIDS=FALSE
);
ALTER TABLE currency
  OWNER TO postgres;

CREATE TABLE documentcategory
(
  id integer NOT NULL,
  name character varying(50) NOT NULL,
  label_en_us character varying(50),
  label_zh_cn character varying(50),
  sequence integer,
  CONSTRAINT documentcategory_pkey PRIMARY KEY (id )
)
WITH (
  OIDS=FALSE
);
ALTER TABLE documentcategory
  OWNER TO postgres;
  
CREATE TABLE documentstatus
(
  id integer NOT NULL,
  name character varying(50) NOT NULL,
  label_en_us character varying(50),
  label_zh_cn character varying(50),
  sequence integer,
  CONSTRAINT documentstatus_pkey PRIMARY KEY (id )
)
WITH (
  OIDS=FALSE
);
ALTER TABLE documentstatus
  OWNER TO postgres;

CREATE TABLE documentsubcategory
(
  id integer NOT NULL,
  name character varying(50) NOT NULL,
  label_en_us character varying(50),
  label_zh_cn character varying(50),
  sequence integer,
  CONSTRAINT documentsubcategory_pkey PRIMARY KEY (id )
)
WITH (
  OIDS=FALSE
);
ALTER TABLE documentsubcategory
  OWNER TO postgres;

CREATE TABLE documenttype
(
  id integer NOT NULL,
  name character varying(50) NOT NULL,
  label_en_us character varying(50),
  label_zh_cn character varying(50),
  sequence integer,
  CONSTRAINT documenttype_pkey PRIMARY KEY (id )
)
WITH (
  OIDS=FALSE
);
ALTER TABLE documenttype
  OWNER TO postgres;
  
CREATE TABLE industry
(
  id integer NOT NULL,
  name character varying(50) NOT NULL,
  label_en_us character varying(50),
  label_zh_cn character varying(50),
  sequence integer,
  CONSTRAINT industry_pkey PRIMARY KEY (id )
)
WITH (
  OIDS=FALSE
);
ALTER TABLE industry
  OWNER TO postgres;
  
CREATE TABLE leadsource
(
  id integer NOT NULL,
  name character varying(50) NOT NULL,
  label_en_us character varying(50),
  label_zh_cn character varying(50),
  sequence integer,
  CONSTRAINT leadsource_pkey PRIMARY KEY (id )
)
WITH (
  OIDS=FALSE
);
ALTER TABLE leadsource
  OWNER TO postgres;
  
CREATE TABLE leadstatus
(
  id integer NOT NULL,
  name character varying(50) NOT NULL,
  label_en_us character varying(50),
  label_zh_cn character varying(50),
  sequence integer,
  CONSTRAINT leadstatus_pkey PRIMARY KEY (id )
)
WITH (
  OIDS=FALSE
);
ALTER TABLE leadstatus
  OWNER TO postgres;

CREATE TABLE meetingstatus
(
  id integer NOT NULL,
  name character varying(50) NOT NULL,
  label_en_us character varying(50),
  label_zh_cn character varying(50),
  sequence integer,
  CONSTRAINT meetingstatus_pkey PRIMARY KEY (id )
)
WITH (
  OIDS=FALSE
);
ALTER TABLE meetingstatus
  OWNER TO postgres;
  
CREATE TABLE opportunitytype
(
  id integer NOT NULL,
  name character varying(50) NOT NULL,
  label_en_us character varying(50),
  label_zh_cn character varying(50),
  sequence integer,
  CONSTRAINT opportunitytype_pkey PRIMARY KEY (id )
)
WITH (
  OIDS=FALSE
);
ALTER TABLE opportunitytype
  OWNER TO postgres;

CREATE TABLE reminderoption
(
  id integer NOT NULL,
  name character varying(50) NOT NULL,
  label_en_us character varying(50),
  label_zh_cn character varying(50),
  sequence integer,
  CONSTRAINT reminderoption_pkey PRIMARY KEY (id )
)
WITH (
  OIDS=FALSE
);
ALTER TABLE reminderoption
  OWNER TO postgres;
  
CREATE TABLE salutation
(
  id integer NOT NULL,
  name character varying(50) NOT NULL,
  label_en_us character varying(50),
  label_zh_cn character varying(50),
  sequence integer,
  CONSTRAINT salutation_pkey PRIMARY KEY (id )
)
WITH (
  OIDS=FALSE
);
ALTER TABLE salutation
  OWNER TO postgres; 
    
CREATE TABLE userstatus
(
  id integer NOT NULL,
  name character varying(50) NOT NULL,
  label_en_us character varying(50),
  label_zh_cn character varying(50),
  sequence integer,
  CONSTRAINT userstatus_pkey PRIMARY KEY (id )
)
WITH (
  OIDS=FALSE
);
ALTER TABLE userstatus
  OWNER TO postgres; 
  
CREATE TABLE users
(
  id integer NOT NULL,
  name character varying(255) NOT NULL,
  first_name character varying(255),
  last_name character varying(255),
  status integer,
  password character varying(255),
  title character varying(255),
  email character varying(255),
  mobile character varying(255),
  phone character varying(255),
  fax character varying(255),
  department character varying(255),
  report_to integer,
  mail_street character varying(255),
  mail_city character varying(255),
  mail_state character varying(255),
  mail_postal_code character varying(255),
  mail_country character varying(255),
  other_street character varying(255),
  other_state character varying(255),
  other_postal_code character varying(255),
  other_country character varying(255),
  age integer,
  smtp_username character varying(255),
  smtp_password character varying(255),
  description character varying(255),
  created_by integer,
  updated_by integer,
  created_on timestamp without time zone,
  updated_on timestamp without time zone,
  owner integer,
  CONSTRAINT users_pkey PRIMARY KEY (id ),
  CONSTRAINT fk6a68e084c37dd59 FOREIGN KEY (created_by)
      REFERENCES users (id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT fk6a68e085e111c0f FOREIGN KEY (status)
      REFERENCES userstatus (id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT fk6a68e08e584d5b1 FOREIGN KEY (report_to)
      REFERENCES users (id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT fk6a68e08e826fe FOREIGN KEY (owner)
      REFERENCES users (id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT fk6a68e08e8f7c6a6 FOREIGN KEY (updated_by)
      REFERENCES users (id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION
)
WITH (
  OIDS=FALSE
);
ALTER TABLE users
  OWNER TO postgres;
    
CREATE TABLE role
(
  id integer NOT NULL,
  name character varying(50) NOT NULL,
  sequence integer,
  created_by integer,
  updated_by integer,
  created_on timestamp without time zone,
  updated_on timestamp without time zone,
  description character varying(255),
  owner integer,
  scope_account integer,
  view_account integer,
  create_account integer,
  update_account integer,
  delete_account integer,
  scope_call integer,
  view_call integer,
  create_call integer,
  update_call integer,
  delete_call integer,
  scope_campaign integer,
  view_campaign integer,
  create_campaign integer,
  update_campaign integer,
  delete_campaign integer,
  scope_case integer,
  view_case integer,
  create_case integer,
  update_case integer,
  delete_case integer,
  scope_contact integer,
  view_contact integer,
  create_contact integer,
  update_contact integer,
  delete_contact integer,
  scope_document integer,
  view_document integer,
  create_document integer,
  update_document integer,
  delete_document integer,
  scope_lead integer,
  view_lead integer,
  create_lead integer,
  update_lead integer,
  delete_lead integer,
  scope_meeting integer,
  view_meeting integer,
  create_meeting integer,
  update_meeting integer,
  delete_meeting integer,
  scope_opportunity integer,
  view_opportunity integer,
  create_opportunity integer,
  update_opportunity integer,
  delete_opportunity integer,
  scope_target integer,
  view_target integer,
  create_target integer,
  update_target integer,
  delete_target integer,
  scope_targetlist integer,
  view_targetlist integer,
  create_targetlist integer,
  update_targetlist integer,
  delete_targetlist integer,
  scope_task integer,
  view_task integer,
  create_task integer,
  update_task integer,
  delete_task integer,
  scope_system integer,
  view_system integer,
  create_system integer,
  update_system integer,
  delete_system integer,
  CONSTRAINT role_pkey PRIMARY KEY (id ),
  CONSTRAINT fk3580764c37dd59 FOREIGN KEY (created_by)
      REFERENCES users (id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT fk358076e826fe FOREIGN KEY (owner)
      REFERENCES users (id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT fk358076e8f7c6a6 FOREIGN KEY (updated_by)
      REFERENCES users (id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION
)
WITH (
  OIDS=FALSE
);
ALTER TABLE role
  OWNER TO postgres;
  
CREATE TABLE salesstage
(
  id integer NOT NULL,
  name character varying(50) NOT NULL,
  label_en_us character varying(50),
  label_zh_cn character varying(50),
  sequence integer,
  CONSTRAINT salesstage_pkey PRIMARY KEY (id )
)
WITH (
  OIDS=FALSE
);
ALTER TABLE salesstage
  OWNER TO postgres;

CREATE TABLE targetlisttype
(
  id integer NOT NULL,
  name character varying(50) NOT NULL,
  label_en_us character varying(50),
  label_zh_cn character varying(50),
 sequence integer,
  CONSTRAINT targetlisttype_pkey PRIMARY KEY (id )
)
WITH (
  OIDS=FALSE
);
ALTER TABLE targetlisttype
  OWNER TO postgres;

CREATE TABLE taskpriority
(
  id integer NOT NULL,
  name character varying(50) NOT NULL,
  label_en_us character varying(50),
  label_zh_cn character varying(50),
  sequence integer,
  CONSTRAINT taskpriority_pkey PRIMARY KEY (id )
)
WITH (
  OIDS=FALSE
);
ALTER TABLE taskpriority
  OWNER TO postgres;
  
CREATE TABLE taskstatus
(
  id integer NOT NULL,
  name character varying(50) NOT NULL,
  label_en_us character varying(50),
  label_zh_cn character varying(50),
  sequence integer,
  CONSTRAINT taskstatus_pkey PRIMARY KEY (id )
)
WITH (
  OIDS=FALSE
);
ALTER TABLE taskstatus
  OWNER TO postgres;
    
CREATE TABLE users_role
(
  user_id integer NOT NULL,
  role_id integer NOT NULL,
  CONSTRAINT users_role_pkey PRIMARY KEY (user_id , role_id ),
  CONSTRAINT fk9459304d4ca45e7a FOREIGN KEY (role_id)
      REFERENCES role (id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT fk9459304df1cf225a FOREIGN KEY (user_id)
      REFERENCES users (id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION
)
WITH (
  OIDS=FALSE
);
ALTER TABLE users_role
  OWNER TO postgres;
   
INSERT INTO userstatus(id, name, label_en_us, label_zh_cn, sequence) VALUES (nextval('hibernate_sequence'),'Active', 'Active', '启用',1);
INSERT INTO userstatus(id, name, label_en_us, label_zh_cn, sequence) VALUES (nextval('hibernate_sequence'),'Inactive', 'Inactive','停用',2);

INSERT INTO users(id, name,password,status) VALUES (nextval('hibernate_sequence'),'admin','f23434d100b958477670c0c4593f69b5',currval('hibernate_sequence') - 2);

INSERT INTO role(id, name, sequence,scope_account, view_account, create_account, 
            update_account, delete_account, scope_call, view_call, 
            create_call, update_call, delete_call, scope_campaign, view_campaign, 
            create_campaign, update_campaign, delete_campaign, scope_case, 
            view_case, create_case, update_case, delete_case, scope_contact, 
            view_contact, create_contact, update_contact, delete_contact, 
            scope_document, view_document, create_document, update_document, 
            delete_document, scope_lead, view_lead, create_lead, update_lead, 
            delete_lead, scope_meeting, view_meeting, create_meeting, update_meeting, 
            delete_meeting, scope_opportunity, view_opportunity, create_opportunity, 
            update_opportunity, delete_opportunity, scope_target, view_target, 
            create_target, update_target, delete_target, scope_targetlist, 
            view_targetlist, create_targetlist, update_targetlist, delete_targetlist, 
            scope_task, view_task, create_task, update_task, delete_task, scope_system, view_system, create_system, update_system, delete_system) VALUES (nextval('hibernate_sequence'),'Administrator', 1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,
            1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1);

INSERT INTO users_role(user_id, role_id) VALUES (currval('hibernate_sequence') - 1 ,currval('hibernate_sequence'));   
  
INSERT INTO accounttype(id, name, label_en_us, label_zh_cn, sequence) VALUES (nextval('hibernate_sequence'),'--None--', '--None--','--空白--',1);
INSERT INTO accounttype(id, name, label_en_us, label_zh_cn, sequence) VALUES (nextval('hibernate_sequence'),'Analyst', 'Analyst','分析者',2);
INSERT INTO accounttype(id, name, label_en_us, label_zh_cn, sequence) VALUES (nextval('hibernate_sequence'),'Competitor', 'Competitor','竞争者',3);
INSERT INTO accounttype(id, name, label_en_us, label_zh_cn, sequence) VALUES (nextval('hibernate_sequence'),'Customer', 'Customer','客户',4);
INSERT INTO accounttype(id, name, label_en_us, label_zh_cn, sequence) VALUES (nextval('hibernate_sequence'),'Integrator', 'Integrator','整合者',5);
INSERT INTO accounttype(id, name, label_en_us, label_zh_cn, sequence) VALUES (nextval('hibernate_sequence'),'Investor', 'Investor','投资者',6);
INSERT INTO accounttype(id, name, label_en_us, label_zh_cn, sequence) VALUES (nextval('hibernate_sequence'),'Partner', 'Partner','合作者',7);
INSERT INTO accounttype(id, name, label_en_us, label_zh_cn, sequence) VALUES (nextval('hibernate_sequence'),'Press', 'Press','出版商',8);
INSERT INTO accounttype(id, name, label_en_us, label_zh_cn, sequence) VALUES (nextval('hibernate_sequence'),'Prospect', 'Prospect','销售前景',9);
INSERT INTO accounttype(id, name, label_en_us, label_zh_cn, sequence) VALUES (nextval('hibernate_sequence'),'Reseller', 'Reseller','批发商',10);
INSERT INTO accounttype(id, name, label_en_us, label_zh_cn, sequence) VALUES (nextval('hibernate_sequence'),'Other', 'Other','其它',11);

INSERT INTO calldirection(id, name, label_en_us, label_zh_cn, sequence) VALUES (nextval('hibernate_sequence'),'Inbound', 'Inbound', '打入', 1);
INSERT INTO calldirection(id, name, label_en_us, label_zh_cn, sequence) VALUES (nextval('hibernate_sequence'),'Outbound', 'Outbound', '打出', 2);

INSERT INTO callstatus(id, name, label_en_us, label_zh_cn, sequence) VALUES (nextval('hibernate_sequence'),'Planned', 'Planned', '已计划', 1);
INSERT INTO callstatus(id, name, label_en_us, label_zh_cn, sequence) VALUES (nextval('hibernate_sequence'),'Held', 'Held', '完成', 2);
INSERT INTO callstatus(id, name, label_en_us, label_zh_cn, sequence) VALUES (nextval('hibernate_sequence'),'Not Held', 'Not Held', '未开始', 3);

INSERT INTO campaignstatus(id, name, label_en_us, label_zh_cn, sequence) VALUES (nextval('hibernate_sequence'),'--None--', '--None--', '--空白--', 1);
INSERT INTO campaignstatus(id, name, label_en_us, label_zh_cn, sequence) VALUES (nextval('hibernate_sequence'),'Planning', 'Planning', '计划中', 2);
INSERT INTO campaignstatus(id, name, label_en_us, label_zh_cn, sequence) VALUES (nextval('hibernate_sequence'),'Active', 'Active', '启用', 3);
INSERT INTO campaignstatus(id, name, label_en_us, label_zh_cn, sequence) VALUES (nextval('hibernate_sequence'),'Inactive', 'Inactive', '停用', 4);
INSERT INTO campaignstatus(id, name, label_en_us, label_zh_cn, sequence) VALUES (nextval('hibernate_sequence'),'Complete', 'Complete', '完成', 5);
INSERT INTO campaignstatus(id, name, label_en_us, label_zh_cn, sequence) VALUES (nextval('hibernate_sequence'),'In Queue', 'In Queue', '队列中', 6);
INSERT INTO campaignstatus(id, name, label_en_us, label_zh_cn, sequence) VALUES (nextval('hibernate_sequence'),'Sending', 'Sending', '发送中', 7);

INSERT INTO campaigntype(id, name, label_en_us, label_zh_cn, sequence) VALUES (nextval('hibernate_sequence'),'--None--', '--None--', '--空白--', 1);
INSERT INTO campaigntype(id, name, label_en_us, label_zh_cn, sequence) VALUES (nextval('hibernate_sequence'),'Telesales', 'Telesales', '电话销售', 2);
INSERT INTO campaigntype(id, name, label_en_us, label_zh_cn, sequence) VALUES (nextval('hibernate_sequence'),'Mail', 'Mail', '邮件', 3);
INSERT INTO campaigntype(id, name, label_en_us, label_zh_cn, sequence) VALUES (nextval('hibernate_sequence'),'Email', 'Email', '电子邮件', 4);
INSERT INTO campaigntype(id, name, label_en_us, label_zh_cn, sequence) VALUES (nextval('hibernate_sequence'),'Print', 'Print', '列印', 5);
INSERT INTO campaigntype(id, name, label_en_us, label_zh_cn, sequence) VALUES (nextval('hibernate_sequence'),'Web', 'Web', '网络', 6);
INSERT INTO campaigntype(id, name, label_en_us, label_zh_cn, sequence) VALUES (nextval('hibernate_sequence'),'Radio', 'Radio', '广播', 7);
INSERT INTO campaigntype(id, name, label_en_us, label_zh_cn, sequence) VALUES (nextval('hibernate_sequence'),'Television', 'Television', '电视', 8);
INSERT INTO campaigntype(id, name, label_en_us, label_zh_cn, sequence) VALUES (nextval('hibernate_sequence'),'NewsLetter', 'NewsLetter', '简讯', 9);

INSERT INTO caseorigin(id, name, label_en_us, label_zh_cn, sequence) VALUES (nextval('hibernate_sequence'),'--None--', '--None--', '--空白--', 1);
INSERT INTO caseorigin(id, name, label_en_us, label_zh_cn, sequence) VALUES (nextval('hibernate_sequence'),'Email', 'Email', '电子邮件', 2);
INSERT INTO caseorigin(id, name, label_en_us, label_zh_cn, sequence) VALUES (nextval('hibernate_sequence'),'Phone', 'Phone', '电话', 3);
INSERT INTO caseorigin(id, name, label_en_us, label_zh_cn, sequence) VALUES (nextval('hibernate_sequence'),'Web', 'Web', '网络', 4);

INSERT INTO casepriority(id, name, label_en_us, label_zh_cn, sequence) VALUES (nextval('hibernate_sequence'),'High', 'High', '高', 1);
INSERT INTO casepriority(id, name, label_en_us, label_zh_cn, sequence) VALUES (nextval('hibernate_sequence'),'Medium', 'Medium', '中', 2);
INSERT INTO casepriority(id, name, label_en_us, label_zh_cn, sequence) VALUES (nextval('hibernate_sequence'),'Low', 'Low', '低', 3);

INSERT INTO casereason(id, name, label_en_us, label_zh_cn, sequence) VALUES (nextval('hibernate_sequence'),'--None--', '--None--', '--空白--', 1);
INSERT INTO casereason(id, name, label_en_us, label_zh_cn, sequence) VALUES (nextval('hibernate_sequence'),'User did not attend training', 'User did not attend training', '用户未参加培训', 2);
INSERT INTO casereason(id, name, label_en_us, label_zh_cn, sequence) VALUES (nextval('hibernate_sequence'),'Complex functionality', 'Complex functionality', '功能复杂', 3);
INSERT INTO casereason(id, name, label_en_us, label_zh_cn, sequence) VALUES (nextval('hibernate_sequence'),'Existing problem', 'Existing problem', '已有问题', 4);
INSERT INTO casereason(id, name, label_en_us, label_zh_cn, sequence) VALUES (nextval('hibernate_sequence'),'Instructions not clear', 'Instructions not clear', '指令不清楚', 5);
INSERT INTO casereason(id, name, label_en_us, label_zh_cn, sequence) VALUES (nextval('hibernate_sequence'),'New problem', 'New problem','新问题', 6);

INSERT INTO casestatus(id, name, label_en_us, label_zh_cn, sequence) VALUES (nextval('hibernate_sequence'),'New', 'New', '新增', 1);
INSERT INTO casestatus(id, name, label_en_us, label_zh_cn, sequence) VALUES (nextval('hibernate_sequence'),'Assigned', 'Assigned', '已分配', 2);
INSERT INTO casestatus(id, name, label_en_us, label_zh_cn, sequence) VALUES (nextval('hibernate_sequence'),'Closed', 'Closed', '结束', 3);
INSERT INTO casestatus(id, name, label_en_us, label_zh_cn, sequence) VALUES (nextval('hibernate_sequence'),'Pending Input', 'Pending Input', '等待输入', 4);
INSERT INTO casestatus(id, name, label_en_us, label_zh_cn, sequence) VALUES (nextval('hibernate_sequence'),'Rejected', 'Rejected', '拒绝', 5);
INSERT INTO casestatus(id, name, label_en_us, label_zh_cn, sequence) VALUES (nextval('hibernate_sequence'),'Duplicate', 'Duplicate', '重复', 6);

INSERT INTO casetype(id, name, label_en_us, label_zh_cn, sequence) VALUES (nextval('hibernate_sequence'),'Administration', 'Administration', '管理员', 1);
INSERT INTO casetype(id, name, label_en_us, label_zh_cn, sequence) VALUES (nextval('hibernate_sequence'),'Product', 'Product', '产品', 2);
INSERT INTO casetype(id, name, label_en_us, label_zh_cn, sequence) VALUES (nextval('hibernate_sequence'),'User', 'User', '用户', 3);

INSERT INTO currency(id, name, code, symbol) VALUES (nextval('hibernate_sequence'),'US Dollars','USD', '$');

INSERT INTO documentcategory(id, name, label_en_us, label_zh_cn, sequence) VALUES (nextval('hibernate_sequence'),'--None--', '--None--', '--空白--', 1);
INSERT INTO documentcategory(id, name, label_en_us, label_zh_cn, sequence) VALUES (nextval('hibernate_sequence'),'Marketing', 'Marketing', '市场', 2);
INSERT INTO documentcategory(id, name, label_en_us, label_zh_cn, sequence) VALUES (nextval('hibernate_sequence'),'Knowledge Base', 'Knowledge Base', '知识库', 3);
INSERT INTO documentcategory(id, name, label_en_us, label_zh_cn, sequence) VALUES (nextval('hibernate_sequence'),'Sales', 'Sales', '销售', 4);

INSERT INTO documentstatus(id, name, label_en_us, label_zh_cn, sequence) VALUES (nextval('hibernate_sequence'),'Active', 'Active', '启用', 1);
INSERT INTO documentstatus(id, name, label_en_us, label_zh_cn, sequence) VALUES (nextval('hibernate_sequence'),'Draft', 'Draft', '草稿', 2);
INSERT INTO documentstatus(id, name, label_en_us, label_zh_cn, sequence) VALUES (nextval('hibernate_sequence'),'FAQ', 'FAQ', '常见问题', 3);
INSERT INTO documentstatus(id, name, label_en_us, label_zh_cn, sequence) VALUES (nextval('hibernate_sequence'),'Expired', 'Expired', '过期', 4);
INSERT INTO documentstatus(id, name, label_en_us, label_zh_cn, sequence) VALUES (nextval('hibernate_sequence'),'Under Review', 'Under Review', '审查中', 5);
INSERT INTO documentstatus(id, name, label_en_us, label_zh_cn, sequence) VALUES (nextval('hibernate_sequence'),'Pending', 'Pending', '待定', 6);

INSERT INTO documentsubcategory(id, name, label_en_us, label_zh_cn, sequence) VALUES (nextval('hibernate_sequence'),'--None--', '--None--', '--空白--', 1);
INSERT INTO documentsubcategory(id, name, label_en_us, label_zh_cn, sequence) VALUES (nextval('hibernate_sequence'),'Marketing Collateral', 'Marketing Collateral', '市场营销', 2);
INSERT INTO documentsubcategory(id, name, label_en_us, label_zh_cn, sequence) VALUES (nextval('hibernate_sequence'),'Product Brochures', 'Product Brochures', '产品手册', 3);
INSERT INTO documentsubcategory(id, name, label_en_us, label_zh_cn, sequence) VALUES (nextval('hibernate_sequence'),'FAQ', 'FAQ', '常见问题', 4);

INSERT INTO documenttype(id, name, label_en_us, label_zh_cn, sequence) VALUES (nextval('hibernate_sequence'),'--None--', '--None--', '--空白--', 1);
INSERT INTO documenttype(id, name, label_en_us, label_zh_cn, sequence) VALUES (nextval('hibernate_sequence'),'Mail Merge', 'Mail Merge', '邮件合并', 2);
INSERT INTO documenttype(id, name, label_en_us, label_zh_cn, sequence) VALUES (nextval('hibernate_sequence'),'License Agreement', 'License Agreement', '许可证协议', 3);

INSERT INTO industry(id, name, label_en_us, label_zh_cn, sequence) VALUES (nextval('hibernate_sequence'),'--None--', '--None--', '--空白--', 1);
INSERT INTO industry(id, name, label_en_us, label_zh_cn, sequence) VALUES (nextval('hibernate_sequence'),'Agriculture', 'Agriculture', '农业', 2);
INSERT INTO industry(id, name, label_en_us, label_zh_cn, sequence) VALUES (nextval('hibernate_sequence'),'Apparel', 'Apparel', '服装', 3);
INSERT INTO industry(id, name, label_en_us, label_zh_cn, sequence) VALUES (nextval('hibernate_sequence'),'Banking', 'Banking', '银行', 4);
INSERT INTO industry(id, name, label_en_us, label_zh_cn, sequence) VALUES (nextval('hibernate_sequence'),'Biotechnology', 'Biotechnology', '生物技术', 5);
INSERT INTO industry(id, name, label_en_us, label_zh_cn, sequence) VALUES (nextval('hibernate_sequence'),'Chemicals', 'Chemicals', '化工', 6);
INSERT INTO industry(id, name, label_en_us, label_zh_cn, sequence) VALUES (nextval('hibernate_sequence'),'Communications', 'Communications', '通讯', 7);
INSERT INTO industry(id, name, label_en_us, label_zh_cn, sequence) VALUES (nextval('hibernate_sequence'),'Construction', 'Construction', '建筑', 8);
INSERT INTO industry(id, name, label_en_us, label_zh_cn, sequence) VALUES (nextval('hibernate_sequence'),'Consulting', 'Consulting', '咨询', 9);
INSERT INTO industry(id, name, label_en_us, label_zh_cn, sequence) VALUES (nextval('hibernate_sequence'),'Education', 'Education', '教育', 10);
INSERT INTO industry(id, name, label_en_us, label_zh_cn, sequence) VALUES (nextval('hibernate_sequence'),'Electronics', 'Electronics', '电子', 11);
INSERT INTO industry(id, name, label_en_us, label_zh_cn, sequence) VALUES (nextval('hibernate_sequence'),'Energy', 'Energy', '能源', 12);
INSERT INTO industry(id, name, label_en_us, label_zh_cn, sequence) VALUES (nextval('hibernate_sequence'),'Engineering', 'Engineering', '工程设计', 13);
INSERT INTO industry(id, name, label_en_us, label_zh_cn, sequence) VALUES (nextval('hibernate_sequence'),'Entertainment', 'Entertainment', '娱乐', 14);
INSERT INTO industry(id, name, label_en_us, label_zh_cn, sequence) VALUES (nextval('hibernate_sequence'),'Environmental', 'Environmental', '环境保护', 15);
INSERT INTO industry(id, name, label_en_us, label_zh_cn, sequence) VALUES (nextval('hibernate_sequence'),'Finance', 'Finance', '金融', 16);
INSERT INTO industry(id, name, label_en_us, label_zh_cn, sequence) VALUES (nextval('hibernate_sequence'),'Government', 'Government', '政府机构', 17);
INSERT INTO industry(id, name, label_en_us, label_zh_cn, sequence) VALUES (nextval('hibernate_sequence'),'Healthcare', 'Healthcare', '卫生保健', 18);
INSERT INTO industry(id, name, label_en_us, label_zh_cn, sequence) VALUES (nextval('hibernate_sequence'),'Hospitality', 'Hospitality', '医疗机构', 19);
INSERT INTO industry(id, name, label_en_us, label_zh_cn, sequence) VALUES (nextval('hibernate_sequence'),'Insurance', 'Insurance', '保险', 20);
INSERT INTO industry(id, name, label_en_us, label_zh_cn, sequence) VALUES (nextval('hibernate_sequence'),'Machinery', 'Machinery', '机械', 21);
INSERT INTO industry(id, name, label_en_us, label_zh_cn, sequence) VALUES (nextval('hibernate_sequence'),'Manufacturing', 'Manufacturing', '生产企业', 22);
INSERT INTO industry(id, name, label_en_us, label_zh_cn, sequence) VALUES (nextval('hibernate_sequence'),'Media', 'Media', '医院', 23);
INSERT INTO industry(id, name, label_en_us, label_zh_cn, sequence) VALUES (nextval('hibernate_sequence'),'Not For Profit', 'Not For Profit', '非盈利机构', 24);
INSERT INTO industry(id, name, label_en_us, label_zh_cn, sequence) VALUES (nextval('hibernate_sequence'),'Recreation', 'Recreation', '娱乐', 25);
INSERT INTO industry(id, name, label_en_us, label_zh_cn, sequence) VALUES (nextval('hibernate_sequence'),'Retail', 'Retail', '零售', 26);
INSERT INTO industry(id, name, label_en_us, label_zh_cn, sequence) VALUES (nextval('hibernate_sequence'),'Shipping', 'Shipping', '海云', 27);
INSERT INTO industry(id, name, label_en_us, label_zh_cn, sequence) VALUES (nextval('hibernate_sequence'),'Technology', 'Technology', '技术', 28);
INSERT INTO industry(id, name, label_en_us, label_zh_cn, sequence) VALUES (nextval('hibernate_sequence'),'Telecommunications', 'Telecommunications', '电讯', 29);
INSERT INTO industry(id, name, label_en_us, label_zh_cn, sequence) VALUES (nextval('hibernate_sequence'),'Transportation', 'Transportation', '运输', 30);
INSERT INTO industry(id, name, label_en_us, label_zh_cn, sequence) VALUES (nextval('hibernate_sequence'),'Utilities', 'Utilities', '公共事业', 31);
INSERT INTO industry(id, name, label_en_us, label_zh_cn, sequence) VALUES (nextval('hibernate_sequence'),'Other', 'Other', '其它', 32);

INSERT INTO leadsource(id, name, label_en_us, label_zh_cn, sequence) VALUES (nextval('hibernate_sequence'),'--None--', '--None--', '--空白--', 1);
INSERT INTO leadsource(id, name, label_en_us, label_zh_cn, sequence) VALUES (nextval('hibernate_sequence'),'Cold Call', 'Cold Call', '意外来访', 2);
INSERT INTO leadsource(id, name, label_en_us, label_zh_cn, sequence) VALUES (nextval('hibernate_sequence'),'Existing Customer', 'Existing Customer', '现有客户', 3);
INSERT INTO leadsource(id, name, label_en_us, label_zh_cn, sequence) VALUES (nextval('hibernate_sequence'),'Self Generated', 'Self Generated', '自产', 4);
INSERT INTO leadsource(id, name, label_en_us, label_zh_cn, sequence) VALUES (nextval('hibernate_sequence'),'Employee', 'Employee', '员工', 5);
INSERT INTO leadsource(id, name, label_en_us, label_zh_cn, sequence) VALUES (nextval('hibernate_sequence'),'Partner', 'Partner', '合作者', 6);
INSERT INTO leadsource(id, name, label_en_us, label_zh_cn, sequence) VALUES (nextval('hibernate_sequence'),'Public Relations', 'Public Relations', '公共关系', 7);
INSERT INTO leadsource(id, name, label_en_us, label_zh_cn, sequence) VALUES (nextval('hibernate_sequence'),'Direct Mail', 'Direct Mail', '直邮', 8);
INSERT INTO leadsource(id, name, label_en_us, label_zh_cn, sequence) VALUES (nextval('hibernate_sequence'),'Conference', 'Conference', '会议', 9);
INSERT INTO leadsource(id, name, label_en_us, label_zh_cn, sequence) VALUES (nextval('hibernate_sequence'),'Trade Show', 'Trade Show', '展览', 10);
INSERT INTO leadsource(id, name, label_en_us, label_zh_cn, sequence) VALUES (nextval('hibernate_sequence'),'Web Site', 'Web Site', '网站', 11);
INSERT INTO leadsource(id, name, label_en_us, label_zh_cn, sequence) VALUES (nextval('hibernate_sequence'),'Word of mouth', 'Word of mouth', '他人介绍', 12);
INSERT INTO leadsource(id, name, label_en_us, label_zh_cn, sequence) VALUES (nextval('hibernate_sequence'),'Email', 'Email', '电子邮件', 13);
INSERT INTO leadsource(id, name, label_en_us, label_zh_cn, sequence) VALUES (nextval('hibernate_sequence'),'Campaign', 'Campaign', '市场活动', 14);
INSERT INTO leadsource(id, name, label_en_us, label_zh_cn, sequence) VALUES (nextval('hibernate_sequence'),'Other', 'Other', '其它', 15);

INSERT INTO leadstatus(id, name, label_en_us, label_zh_cn, sequence) VALUES (nextval('hibernate_sequence'),'--None--', '--None--', '--空白--', 1);
INSERT INTO leadstatus(id, name, label_en_us, label_zh_cn, sequence) VALUES (nextval('hibernate_sequence'),'New', 'New', '新增', 2);
INSERT INTO leadstatus(id, name, label_en_us, label_zh_cn, sequence) VALUES (nextval('hibernate_sequence'),'Assigned', 'Assigned', '已分配', 3);
INSERT INTO leadstatus(id, name, label_en_us, label_zh_cn, sequence) VALUES (nextval('hibernate_sequence'),'In Process', 'In Process', '处理中', 4);
INSERT INTO leadstatus(id, name, label_en_us, label_zh_cn, sequence) VALUES (nextval('hibernate_sequence'),'Converted', 'Converted', '已转换', 5);
INSERT INTO leadstatus(id, name, label_en_us, label_zh_cn, sequence) VALUES (nextval('hibernate_sequence'),'Recycled', 'Recycled', '已重复', 6);
INSERT INTO leadstatus(id, name, label_en_us, label_zh_cn, sequence) VALUES (nextval('hibernate_sequence'),'Dead', 'Dead', '终止', 7);

INSERT INTO meetingstatus(id, name, label_en_us, label_zh_cn, sequence) VALUES (nextval('hibernate_sequence'),'Planned', 'Planned', '已计划', 1);
INSERT INTO meetingstatus(id, name, label_en_us, label_zh_cn, sequence) VALUES (nextval('hibernate_sequence'),'Held', 'Held', '完成', 2);
INSERT INTO meetingstatus(id, name, label_en_us, label_zh_cn, sequence) VALUES (nextval('hibernate_sequence'),'Not Held', 'Not Held', '未开始', 3);

INSERT INTO opportunitytype(id, name, label_en_us, label_zh_cn, sequence) VALUES (nextval('hibernate_sequence'),'--None--', '--None--', '--空白--', 1);
INSERT INTO opportunitytype(id, name, label_en_us, label_zh_cn, sequence) VALUES (nextval('hibernate_sequence'),'Existing Business', 'Existing Business', '已有生意', 2);
INSERT INTO opportunitytype(id, name, label_en_us, label_zh_cn, sequence) VALUES (nextval('hibernate_sequence'),'New Business', 'New Business', '新生意', 3);

INSERT INTO reminderoption(id, name, label_en_us, label_zh_cn, sequence) VALUES (nextval('hibernate_sequence'),'1 minute prior', '1 minute prior', '提前1分钟', 1);
INSERT INTO reminderoption(id, name, label_en_us, label_zh_cn, sequence) VALUES (nextval('hibernate_sequence'),'5 minutes prior', '5 minutes prior', '提前5分钟', 2);
INSERT INTO reminderoption(id, name, label_en_us, label_zh_cn, sequence) VALUES (nextval('hibernate_sequence'),'10 minutes prior', '10 minutes prior', '提前10分钟', 3);
INSERT INTO reminderoption(id, name, label_en_us, label_zh_cn, sequence) VALUES (nextval('hibernate_sequence'),'15 minutes prior', '15 minutes prior', '提前15分钟', 4);
INSERT INTO reminderoption(id, name, label_en_us, label_zh_cn, sequence) VALUES (nextval('hibernate_sequence'),'30 minutes prior', '30 minutes prior', '提前30分钟', 5);
INSERT INTO reminderoption(id, name, label_en_us, label_zh_cn, sequence) VALUES (nextval('hibernate_sequence'),'1 hour prior', '1 hour prior', '提前1小时', 6);
INSERT INTO reminderoption(id, name, label_en_us, label_zh_cn, sequence) VALUES (nextval('hibernate_sequence'),'2 hours prior', '2 hours prior', '提前2小时', 7);
INSERT INTO reminderoption(id, name, label_en_us, label_zh_cn, sequence) VALUES (nextval('hibernate_sequence'),'3 hours prior', '3 hours prior', '提前3小时', 8);
INSERT INTO reminderoption(id, name, label_en_us, label_zh_cn, sequence) VALUES (nextval('hibernate_sequence'),'5 hours prior', '5 hours prior', '提前5小时', 9);
INSERT INTO reminderoption(id, name, label_en_us, label_zh_cn, sequence) VALUES (nextval('hibernate_sequence'),'1 day prior', '1 day prior', '提前1天', 10);

INSERT INTO salesstage(id, name, label_en_us, label_zh_cn, sequence) VALUES (nextval('hibernate_sequence'),'--None--', '--None--', '--空白--', 1);
INSERT INTO salesstage(id, name, label_en_us, label_zh_cn, sequence) VALUES (nextval('hibernate_sequence'),'Prospecting', 'Prospecting', '销售前景', 2);
INSERT INTO salesstage(id, name, label_en_us, label_zh_cn, sequence) VALUES (nextval('hibernate_sequence'),'Qualification', 'Qualification', '资格合格', 3);
INSERT INTO salesstage(id, name, label_en_us, label_zh_cn, sequence) VALUES (nextval('hibernate_sequence'),'Needs Analysis', 'Needs Analysis', '需要分析', 4);
INSERT INTO salesstage(id, name, label_en_us, label_zh_cn, sequence) VALUES (nextval('hibernate_sequence'),'Value Proposition', 'Value Proposition', '价值陈述', 5);
INSERT INTO salesstage(id, name, label_en_us, label_zh_cn, sequence) VALUES (nextval('hibernate_sequence'),'Id. Decision Makers', 'Id. Decision Makers', '判决决策者', 6);
INSERT INTO salesstage(id, name, label_en_us, label_zh_cn, sequence) VALUES (nextval('hibernate_sequence'),'Perception Analysis', 'Perception Analysis', '感觉分析', 7);
INSERT INTO salesstage(id, name, label_en_us, label_zh_cn, sequence) VALUES (nextval('hibernate_sequence'),'Proposal/Price Quote', 'Proposal/Price Quote', '建议/出价', 8);
INSERT INTO salesstage(id, name, label_en_us, label_zh_cn, sequence) VALUES (nextval('hibernate_sequence'),'Negotiation/Review', 'Negotiation/Review', '谈判/回顾', 9);
INSERT INTO salesstage(id, name, label_en_us, label_zh_cn, sequence) VALUES (nextval('hibernate_sequence'),'Closed Won', 'Closed Won', '谈成结束', 10);
INSERT INTO salesstage(id, name, label_en_us, label_zh_cn, sequence) VALUES (nextval('hibernate_sequence'),'Closed Lost', 'Closed Lost', '丢单结束', 11);

INSERT INTO salutation(id, name, label_en_us, label_zh_cn, sequence) VALUES (nextval('hibernate_sequence'),'--None--', '--None--', '--空白--', 1);
INSERT INTO salutation(id, name, label_en_us, label_zh_cn, sequence) VALUES (nextval('hibernate_sequence'),'Mr.', 'Mr.', '先生', 2);
INSERT INTO salutation(id, name, label_en_us, label_zh_cn, sequence) VALUES (nextval('hibernate_sequence'),'Ms.', 'Ms.', '女士', 3);
INSERT INTO salutation(id, name, label_en_us, label_zh_cn, sequence) VALUES (nextval('hibernate_sequence'),'Mrs.', 'Mrs.', '夫人', 4);
INSERT INTO salutation(id, name, label_en_us, label_zh_cn, sequence) VALUES (nextval('hibernate_sequence'),'Dr.', 'Dr.', '博士', 5);
INSERT INTO salutation(id, name, label_en_us, label_zh_cn, sequence) VALUES (nextval('hibernate_sequence'),'Prof.', 'Prof.', '教授', 6);

INSERT INTO taskpriority(id, name, label_en_us, label_zh_cn, sequence) VALUES (nextval('hibernate_sequence'),'High', 'High', '高', 1);
INSERT INTO taskpriority(id, name, label_en_us, label_zh_cn, sequence) VALUES (nextval('hibernate_sequence'),'Medium', 'Medium', '中', 2);
INSERT INTO taskpriority(id, name, label_en_us, label_zh_cn, sequence) VALUES (nextval('hibernate_sequence'),'Low', 'Low', '低', 3);

INSERT INTO taskstatus(id, name, label_en_us, label_zh_cn, sequence) VALUES (nextval('hibernate_sequence'),'Not Started', 'Not Started', '未开始', 1);
INSERT INTO taskstatus(id, name, label_en_us, label_zh_cn, sequence) VALUES (nextval('hibernate_sequence'),'In Progress', 'In Progress', '处理中', 2);
INSERT INTO taskstatus(id, name, label_en_us, label_zh_cn, sequence) VALUES (nextval('hibernate_sequence'),'Completed', 'Completed', '完成', 3);
INSERT INTO taskstatus(id, name, label_en_us, label_zh_cn, sequence) VALUES (nextval('hibernate_sequence'),'Pending Input', 'Pending Input', '等待输入', 4);
INSERT INTO taskstatus(id, name, label_en_us, label_zh_cn, sequence) VALUES (nextval('hibernate_sequence'),'Deferred', 'Deferred', '延期', 5);

INSERT INTO targetlisttype(id, name, label_en_us, label_zh_cn, sequence) VALUES (nextval('hibernate_sequence'),'Default', 'Default', '默认', 1);
INSERT INTO targetlisttype(id, name, label_en_us, label_zh_cn, sequence) VALUES (nextval('hibernate_sequence'),'Seed', 'Seed', '种子', 2);
INSERT INTO targetlisttype(id, name, label_en_us, label_zh_cn, sequence) VALUES (nextval('hibernate_sequence'),'Suppression list - By Domain', 'Suppression list - Ey Domain', '阻止列表  - 根据域', 3);
INSERT INTO targetlisttype(id, name, label_en_us, label_zh_cn, sequence) VALUES (nextval('hibernate_sequence'),'Suppression list - By Email Address', 'Suppression list  - By Email Address', '阻止列表   - 根据电子邮件', 4);
INSERT INTO targetlisttype(id, name, label_en_us, label_zh_cn, sequence) VALUES (nextval('hibernate_sequence'),'Suppression list - By ID', 'Suppression list - By ID', '阻止列表  - 根据 编号', 5);
INSERT INTO targetlisttype(id, name, label_en_us, label_zh_cn, sequence) VALUES (nextval('hibernate_sequence'),'Test', 'Test', '测试', 6);

update users set created_by=3,owner=3,created_on=now();
update role set created_by=3,owner=3,created_on=now();




