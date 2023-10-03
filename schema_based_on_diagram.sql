CREATE TABLE patients (
  id BIGSERIAL PRIMARY KEY NOT NULL,
  name VARCHAR(100) NOT NULL,
  date_of_birth DATE NOT NULL,
);

CREATE TABLE medical_histories (
  id BIGSERIAL PRIMARY KEY NOT NULL,
  admitted_at TIMESTAMP NOT NULL,
  patient_id INT NOT NULL,
  status VARCHAR(50),
  CONSTRAINT fk_patient_id
    FOREIGN KEY (patient_id)
    REFERENCES patients(id)
);

CREATE TABLE invoices (
  id BIGSERIAL PRIMARY KEY NOT NULL,
  total_amount DECIMAL NOT NULL,
  generated_at TIMESTAMP NOT NULL,
  payed_at TIMESTAMP NOT NULL,
  medical_history_id INT NOT NULL,
  CONSTRAINT fk_medical_history_id
    FOREIGN KEY (medical_history_id)
    REFERENCES medical_histories(id)
);

CREATE TABLE treatments (
  id BIGSERIAL PRIMARY KEY NOT NULL,
  type VARCHAR(50),
  name VARCHAR(100)
);

CREATE TABLE invoice_items (
  id BIGSERIAL PRIMARY KEY NOT NULL,
  unit_price DECIMAL NOT NULL,
  quantity INT NOT NULL,
  total_price DECIMAL NOT NULL,
  invoice_id INT NOT NULL,
  treatment_id INT NOT NULL,
  CONSTRAINT fk_invoice_id
    FOREIGN KEY (invoice_id)
    REFERENCES invoices(id),
  CONSTRAINT fk_treatment_id
    FOREIGN KEY (treatment_id)
    REFERENCES treatments(id)
);

CREATE TABLE medical-treatments (
  id BIGSERIAL PRIMARY KEY NOT NULL,
  medical_history_id INT,
  invoice_id INT
);