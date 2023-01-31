describe('Junge app', () => {
  beforeEach(() => {
    cy.visit('/')
  });

  it('visits the Home Page', () => {
    cy.contains('h1', 'The Jungle')
  });

  it('There are profucts on the page', () => {
    cy.get('.products article').should('be.visible');
  });
  
  it("There is 2 products on the page", () => {
    cy.get(".products article").should("have.length", 2);
  });
})