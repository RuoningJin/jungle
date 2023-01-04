describe('home page', () => {
  beforeEach(() => {
    cy.visit('users/new')
    .get('[name="user[name]"]')
    .type('ron')
    .get('[name="user[email]"]')
    .type('ron@email.com')
    .get('[name="user[password]"]')
    .type('123')
    .get('[name="user[password_confirmation]"]')
    .type('123')
    .get('[name="commit"]')
    .click()
    .visit('/')
    .get('[name="email"]')
    .type('ron@email.com')
    .get('[name="password"]')
    .type('123')
    .get('[name="commit"]')
    .click()
  })

  it("There is products on the page", () => {
    cy.get(".products article").should("be.visible");
  });

  it("There is 2 products on the page", () => {
    cy.get(".products article").should("have.length", 2);
  });
})