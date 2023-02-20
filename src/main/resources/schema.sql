CREATE TABLE users (
    user_id INT NOT NULL AUTO_INCREMENT,
    nick VARCHAR(20) NOT NULL,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(255) NOT NULL,
    password VARCHAR(255) NOT NULL,
    PRIMARY KEY (user_id)
);

CREATE TABLE trainers (
    trainer_id INT NOT NULL AUTO_INCREMENT,
    user_id INT NOT NULL,
    PRIMARY KEY (trainer_id),
    FOREIGN KEY (user_id) REFERENCES users(user_id)
);

CREATE TABLE clients (
    client_id INT NOT NULL AUTO_INCREMENT,
    user_id INT NOT NULL,
    trainer_id INT,
    PRIMARY KEY (client_id),
    FOREIGN KEY (user_id) REFERENCES users(user_id),
    FOREIGN KEY (trainer_id) REFERENCES trainers(trainer_id)
);

CREATE TABLE training_plans (
    plan_id INT NOT NULL AUTO_INCREMENT,
    client_id INT NOT NULL,
    exercise_name VARCHAR(50) NOT NULL,
    sets INT NOT NULL,
    reps INT NOT NULL,
    weight INT NOT NULL,
    PRIMARY KEY (plan_id),
    FOREIGN KEY (client_id) REFERENCES clients(client_id)
);

CREATE TABLE body_measurements (
    measurement_id INT NOT NULL AUTO_INCREMENT,
    client_id INT NOT NULL,
    measurement_date DATE NOT NULL,
    weight FLOAT NOT NULL,
    PRIMARY KEY (measurement_id),
    FOREIGN KEY (client_id) REFERENCES clients(client_id)
);