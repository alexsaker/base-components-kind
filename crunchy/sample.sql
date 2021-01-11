CREATE TABLE public.accounts (
	user_id serial PRIMARY KEY,
	username VARCHAR ( 50 ) UNIQUE NOT NULL,
	password VARCHAR ( 50 ) NOT NULL,
	email VARCHAR ( 255 ) UNIQUE NOT NULL,
	created_on TIMESTAMP NOT NULL,
        last_login TIMESTAMP 
);
CREATE TABLE public.roles(
   role_id serial PRIMARY KEY,
   role_name VARCHAR (255) UNIQUE NOT NULL
);

CREATE TABLE public.account_roles (
  user_id INT NOT NULL,
  role_id INT NOT NULL,
  grant_date TIMESTAMP,
  PRIMARY KEY (user_id, role_id),
  FOREIGN KEY (role_id)
      REFERENCES roles (role_id),
  FOREIGN KEY (user_id)
      REFERENCES accounts (user_id)
);

INSERT INTO public.roles (role_id,role_name) VALUES (1,'user'),(2,'admin');
INSERT INTO public.accounts (user_id,username,password,email,created_on,last_login)
VALUES (1,'john','willnevergiveyoumypassword','john.doe@gmail.com',NOW(),NOW()),(2,'jane','willnevergiveyoumypasswordagain','jane.doe@gmail.com',NOW(),NOW())
INSERT INTO public.account_roles (user_id,role_id,grant_date) values (1,1,NOW()),(2,2,NOW())