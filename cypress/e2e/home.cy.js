// cypress/e2e/login.spec.js

const URL = 'https://sellin.ox-shop.com/user/login';

const ACC = 'admin';
const PASS_WEB = 'AdminSpainIT$%$@!@2025';
const WRONG_PASS = 'TESTPASS';
const WRONG_ACC = 'admintest';

const loc = {
  //Menu
  saleCenter: "a:contains('Sale center')",
  distributor: "a:contains('Client')",
  addNew: "button:contains('Add New')", 
  
  // Create Distributor fields
  customerName: "#title",
  storeName: "#name",
  usertype: "#user_type",
  distributorType: "#distributor_type",

  // Tax info
  taxCountry: "#country_addressTax",
  taxProvince: "#province_addressTax",
  taxCity: "#district_addressTax",
  taxDistrict: "#street_addressTax",
  taxPostal: "#postalcode_addressTax",
  taxAddress: "#add_addressTax",
  nif: "#nif",
  whatp: "#contact_country_code",
  whatsapp: "#whats_app",
  email: "#email",

  // Delivery info
  recipientName: "#recipient_name",
  phoneCode: "#country_code_phone",
  tel: "#tel",

  deliveryCountry: "#country_delivery1",
  deliveryProvince: "#province_delivery1",
  deliveryCity: "#district_delivery1",
  deliveryStreet: "#street_delivery1",
  deliveryPostal: "#postalcode_delivery1",

  shippingFeeCheck: "#shipping_fee_status_delivery1",
  shippingFeeInput: "#shipping_fee_delivery1",
  deliveryAddress: "#add_delivery1",
  warehouse: "#warehouse_id",
  note: "#nots",

  submit: "button[type='submit']:contains('Submit')",
  okPopup: "button:contains('OK')"
};

describe('Admin login tests', () => {

  beforeEach(() => {
    cy.clearCookies();
    cy.clearLocalStorage();
    cy.visit(URL);
  });

  // it('login fail wrong user name', () => {
  //   // ถ้าหลุดหน้า login ก็ปิด popup ก่อน
  //   cy.get('input[name="email"]').type(WRONG_ACC);
  //   cy.get('input[name="password"]').type(PASS_WEB);
  //   cy.get('button[type="submit"]').click();

  //   cy.contains('Username or password is invalid!', { timeout: 5000 }).should('exist');
  // });

  // it('login fail wrong pass', () => {
  //   cy.get('input[name="email"]').type(ACC);
  //   cy.get('input[name="password"]').type(WRONG_PASS);
  //   cy.get('button[type="submit"]').click();

  //   cy.contains('Username or password is invalid!', { timeout: 5000 }).should('exist');
  // });

  // it('login fail wrong pass', () => {
  //   cy.get('input[name="email"]').type(ACC);
  //   cy.get('input[name="password"]').type(WRONG_PASS);
  //   cy.get('button[type="submit"]').click();

  //   cy.contains('Username or password is invalid!', { timeout: 5000 }).should('exist');
  // });

//Create Distributor Process ( Login Process )
  it('login success', () => {
    cy.get('input[name="email"]').type(ACC);
    cy.get('input[name="password"]').type(PASS_WEB);
    cy.get('button[type="submit"]').click();

    cy.url().should('include', '/');
    cy.contains('Dashboard Inbound & Outbound', { timeout: 8000 }).should('exist');
  });
//Click Menu Process
  it('GO Sale Center and Create Distribtor', () => {
    cy.get('input[name="email"]').type(ACC);
    cy.get('input[name="password"]').type(PASS_WEB);
    cy.get('button[type="submit"]').click();

    cy.url().should('include', '/');
    cy.contains('Dashboard Inbound & Outbound', { timeout: 8000 }).should('exist');
    cy.screenshot("login_success");

    cy.contains("Sale center", { timeout: 10000 }).click();
    cy.contains("Client", { timeout: 10000 }).click();
    cy.contains("Add New", { timeout: 10000 }).click();

//Create Distributor
    cy.get(loc.customerName).type("BongYu2");
    cy.get(loc.storeName).type("SRSSTest");
    cy.get(loc.distributorType).select("1");

  // --------------------- INVOICE INFO ---------------------
  cy.get(loc.taxCountry).select("Spain");
  cy.wait(1000);

  cy.get(loc.taxProvince).select("Aragon");
  cy.wait(1000);

  cy.get(loc.taxCity).select("Provincia de Teruel");
  cy.wait(1000);

  cy.get('#street_addressTax')
  .then($select => {
    const val = 'Abejuela';
    cy.wrap($select)
      .select(val, { force: true })   // select ค่าใน hidden select
  });

  cy.get('#street_addressTax').should('have.value', '6361428');

  cy.get('input[name="postalcode_addressTax"]').type(ACC);
  cy.get(loc.taxAddress).type("Test Tax Address");

  cy.get(loc.nif).type("test");
  cy.get('#contact_country_code')
  .then($select => {
    const val = '+66 TH';
    cy.wrap($select)
      .select(val, { force: true })   // select ค่าใน hidden select
  });

cy.get('#contact_country_code').should('have.value', '+66');
  cy.get(loc.tel).type("0654389470");
  cy.get(loc.whatsapp).type("0654389470");
  cy.get(loc.email).type("ksrc034@gmail.com");

  // --------------------- RECEIVER INFO ---------------------
  cy.get(loc.recipientName).type("Recipient Test Name");
  cy.get('#country_code_phone')
  .then($select => {
    const val = '+66 TH';
    cy.wrap($select)
      .select(val, { force: true })   // select ค่าใน hidden select
  });

cy.get('#country_code_phone').should('have.value', '+66');
  cy.get(loc.tel).type("0654389470");

  cy.get(loc.deliveryCountry).select("Spain");
  cy.wait(1000);

  cy.get(loc.deliveryProvince).select("Aragon");
  cy.wait(1000);

  cy.get(loc.deliveryCity).select("Provincia de Teruel");
  cy.wait(1000);

  cy.get('#street_delivery1')
  .then($select => {
    const val = 'Abejuela';
    cy.wrap($select)
      .select(val, { force: true })   // select ค่าใน hidden select
  });

cy.get('#street_delivery1').should('have.value', '6361428');

  cy.get('input[name="postalcode_delivery1"]').type(ACC);
  cy.get(loc.shippingFeeCheck).click();
  cy.get(loc.shippingFeeInput).type("50");
  cy.get(loc.deliveryAddress).type("test");


//Contact
  cy.get(loc.warehouse).select("VMC");
  cy.get(loc.note).type("test");

// --------------------- SUBMIT ---------------------
  cy.get(loc.submit).click();
  cy.wait(2000);
  
  cy.wait(3000);
  cy.screenshot("create_distributor_success");

//Create
    
  });

});

