// cypress/e2e/login.spec.js

const URL = 'https://sellin.ox-shop.com/user/login';

const ACC = 'admin';
const PASS_WEB = 'AdminSpainIT$%$@!@2025';
const WRONG_PASS = 'TESTPASS';
const WRONG_ACC = 'admintest';

describe('Admin login tests', () => {

  beforeEach(() => {
    cy.clearCookies();
    cy.clearLocalStorage();
    cy.visit(URL);
  });

  it('login success', () => {
    cy.get('input[name="email"]').type(ACC);
    cy.get('input[name="password"]').type(PASS_WEB);
    cy.get('button[type="submit"]').click();

    cy.url().should('include', '/');
    cy.contains('Dashboard Inbound & Outbound', { timeout: 8000 }).should('exist');
  });

  it('login fail wrong user name', () => {
    // ถ้าหลุดหน้า login ก็ปิด popup ก่อน
    cy.get('input[name="email"]').type(WRONG_ACC);
    cy.get('input[name="password"]').type(PASS_WEB);
    cy.get('button[type="submit"]').click();

    cy.contains('Username or password is invalid!', { timeout: 5000 }).should('exist');
  });

  it('login fail wrong pass', () => {
    cy.get('input[name="email"]').type(ACC);
    cy.get('input[name="password"]').type(WRONG_PASS);
    cy.get('button[type="submit"]').click();

    cy.contains('Username or password is invalid!', { timeout: 5000 }).should('exist');
  });

});
