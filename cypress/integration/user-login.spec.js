describe('user login', () => {

  it('signs up with a new user', () => {
    cy.visit('/')
    cy.get('.nav-item .nav-link').contains('Sign Up').click()
    cy.get('[name="user[first_name]"').type('John')
    cy.get('[name="user[last_name]"').type('Doe')
    cy.get('[name="user[email]"').type('test@test.com')
    cy.get('[name="user[password]"').type('password')
    cy.get('[name="user[password_confirmation]"').type('password')
    cy.get('[value="Submit"]').click()
    cy.contains('.nav-item.nav-link.active', 'Signed in as John Doe')
  });

  it('logs out successfully', () => {
    cy.get('.nav-link').contains('Logout').click()
    cy.contains('h1', 'Login')
  });

  it('logs in with the created user', () => {
    cy.visit('/')
    cy.get('.nav-link').contains('Login').click()
    cy.get('[name="email"]').type('test@test.com')
    cy.get('[name="password"]').type('password')
    cy.get('[value="Submit"]').click()
    cy.contains('.nav-item.nav-link.active', 'Signed in as John Doe')
  });
});