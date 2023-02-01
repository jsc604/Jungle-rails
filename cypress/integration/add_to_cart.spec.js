describe('add to cart', () => {
  beforeEach(() => {
    cy.visit('/')
  });

  it('visits the Home Page', () => {
    cy.contains('h1', 'The Jungle')
  });

  it('There are products on the page', () => {
    cy.get('.products article').should('be.visible');
  });
  
  it("There is 2 products on the page", () => {
    cy.get(".products article").should("have.length", 2);
  });

  it('visits the product detail page of the product that was clicked and adds to cart', () => {
    cy.get('[alt="Scented Blade"]').click()
    cy.contains('.product-detail div h1', 'Scented Blade')
    cy.get('.nav-item.end-0 .nav-link').contains('My Cart (0)')
    cy.get('form').click()
    cy.get('.nav-item.end-0 .nav-link').contains('My Cart (1)')
  });

});