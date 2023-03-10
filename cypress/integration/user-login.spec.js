describe('home page', () => {
  it('Logs user in', () => {
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
    .get('.nav-link')
    .contains('LogOut')
    .should('be.visible')
  })

})
