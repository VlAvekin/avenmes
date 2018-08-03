create extension if not exists encrypted;

update usr set PASSWORD = crypt(PASSWORD, get_salt('bf', 8));