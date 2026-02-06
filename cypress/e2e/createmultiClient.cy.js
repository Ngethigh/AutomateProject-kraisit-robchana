// cypress/e2e/create_distributor_all.spec.js
// Create Client Multiple Time And Different Type
const URL = 'https://sellin.ox-shop.com/user/login';

const ACC = 'admin';
const PASS_WEB = 'AdminSpainIT$%$@!@2025';

const loc = {
  saleCenter: "a:contains('Sale center')",
  distributor: "a:contains('Client')",
  addNew: "button:contains('Add New')",

  customerName: "#title",
  storeName: "#name",
  user_type: "#user_type",
  distributorType: "#distributor_type",
  storeType: "#store_type", // เพิ่มสำหรับ Store

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

  recipientName: "#recipient_name",
  phoneCode: "#country_code_phone",
  // tel: "#tel",

  deliveryCountry: "#country_delivery1",
  deliveryProvince: "#province_delivery1",
  deliveryCity: "#district_delivery1",
  deliveryStreet: "#street_delivery1",
  //deliveryPostal: "#postalcode_delivery1",

  deliveryAddress: "#add_delivery1",

  warehouse: "#warehouse_id",
  note: "#nots",

  submit: "button[type='submit']:contains('Submit')",
  okPopup: "button:contains('OK')"
};

// --------------------------------------
// TYPE GROUPS
// --------------------------------------
const userTypeSets = [
  {
    user_type: "1", // Distributor
    distributor_type: "1",
    name: "Distributor"
  },
  {
    user_type: "2", // Store
    distributor_type: "2", // Estanco
    name: "Estanco"
  },
  {
    user_type: "2", // Store
    distributor_type: "3", // Vape Shop
    name: "VapeShop"
  },
  {
    user_type: "2", // Store
    distributor_type: "4", // Store
    name: "Store"
  },
  {
    user_type: "2", // Store
    distributor_type: "5", // Oficina
    name: "Oficina"
  },
  {
    user_type: "2", // Store
    distributor_type: "6", // Otros
    name: "Otros"
  },
  {
    user_type: "2", // Store
    distributor_type: "7", // Alimentación/Bazar
    name: "Alimentacion"
  }
];

// --------------------------------------
// RANDOM FUNCTIONS
// --------------------------------------
function randomID() {
  return Math.floor(1000 + Math.random() * 9000); 
}

// --------------------------------------
// SUPER STABLE SELECT
// --------------------------------------
function retrySelect(selector, value, tries = 10) {
  cy.log(`Selecting ${value} from ${selector}`);

  function attempt(n) {
    cy.get('body').then($body => {
      // Check if element exists
      if ($body.find(selector).length === 0) {
        if (n <= 0) {
          throw new Error(`Element not found: ${selector}`);
        }
        cy.wait(700);
        attempt(n - 1);
        return;
      }

      cy.get(selector, { timeout: 10000 }).then($select => {
        const opt = [...$select[0].options].map(o => ({
          text: o.textContent.trim(),
          value: o.value
        }));

        const foundByText = opt.find(o => o.text === value);
        const foundByValue = opt.find(o => o.value === value);

        if (foundByText || foundByValue) {
          const selectValue = foundByText ? foundByText.text : foundByValue.value;
          cy.get(selector).select(selectValue, { force: true });
          return;
        }

        if (n <= 0) {
          throw new Error(`FAILED: ${selector} ไม่มี option: ${value}`);
        }

        cy.wait(700);
        attempt(n - 1);
      });
    });
  }

  attempt(tries);
}

// --------------------------------------
// WAIT FOR ELEMENT TO BE VISIBLE
// --------------------------------------
function waitForElement(selector, timeout = 10000) {
  cy.get(selector, { timeout }).should('be.visible');
}

// --------------------------------------
// MAIN TEST
// --------------------------------------
describe("Create All Distributor Types", () => {

  beforeEach(() => {
    cy.clearCookies();
    cy.clearLocalStorage();
    cy.visit(URL);

    cy.get('input[name="email"]').type(ACC);
    cy.get('input[name="password"]').type(PASS_WEB);
    cy.get('button[type="submit"]').click();

    cy.contains("Dashboard Inbound & Outbound", { timeout: 8000 }).should("exist");
  });

  userTypeSets.forEach((typeConfig, index) => {

    it(`Create ${typeConfig.name} (User Type ${typeConfig.user_type}, Dist Type ${typeConfig.distributor_type})`, () => {

      const RID = randomID();
      const companyName = `Auto_${typeConfig.name}_${RID}`;
      const storeName = `Store_${typeConfig.name}_${RID}`;
      const email = `auto_${typeConfig.name}_${RID}@gmail.com`;

      // MENU PATH
      cy.contains("Sale center").click();
      cy.contains("Client").click();
      cy.contains("Add New").click();

      // Wait for form to load
      cy.get(loc.customerName, { timeout: 10000 }).should('be.visible');

      // SELECT USER TYPE FIRST
      cy.log(`Selecting user type: ${typeConfig.user_type}`);
      retrySelect(loc.user_type, typeConfig.user_type);

      // WAIT FOR DISTRIBUTOR/STORE TYPE TO APPEAR
      cy.wait(2000);

      // SELECT DISTRIBUTOR TYPE OR STORE TYPE BASED ON USER TYPE
      if (typeConfig.user_type === "1") {
        // Distributor
        cy.log('Selecting distributor type');
        retrySelect(loc.distributorType, typeConfig.distributor_type);
      } else {
        // Store
        cy.log('Selecting store type');
        retrySelect(loc.storeType, typeConfig.distributor_type);
      }

      // BASIC INFO
      cy.get(loc.customerName).clear().type(companyName);
      cy.get(loc.storeName).clear().type(storeName);

      // TAX
      // retrySelect(loc.taxCountry, "Spain");
      // retrySelect(loc.taxProvince, "Aragon");
      // retrySelect(loc.taxCity, "Provincia de Teruel");
      // retrySelect(loc.taxDistrict, "Abejuela");

      // cy.get(loc.taxPostal).clear().type("10000");
      // cy.get(loc.taxAddress).clear().type("Tax Address Auto");
      cy.get(loc.nif).clear().type(`NIF${RID}`);

      retrySelect(loc.whatp, "+66 TH");
      cy.get(loc.tel).clear().type("0800000000");
      cy.get(loc.whatsapp).clear().type("0800000000");
      cy.get(loc.email).clear().type(email);

      // RECEIVER
      cy.get(loc.recipientName).clear().type("Receiver Auto");
      retrySelect(loc.phoneCode, "+66 TH");
      cy.get(loc.tel).clear().type("0800000000");

      retrySelect(loc.deliveryCountry, "Spain");
      retrySelect(loc.deliveryProvince, "Aragon");
      retrySelect(loc.deliveryCity, "Provincia de Teruel");
      retrySelect(loc.deliveryStreet, "Abejuela");

      //cy.get(loc.deliveryPostal).clear().type("10000");
      cy.get(loc.deliveryAddress).clear().type("Delivery Auto");

      retrySelect(loc.warehouse, "VMC");
      cy.get(loc.note).clear().type("Auto Test");

      // SUBMIT
      cy.get(loc.submit).click();
      cy.wait(2500);

      // Check for success message or popup
      cy.get('body').then(($body) => {
        if ($body.find(loc.okPopup).length > 0) {
          cy.get(loc.okPopup).click();
        }
      });

      cy.screenshot(`create_${typeConfig.name}_${RID}`);
    });

  });

});