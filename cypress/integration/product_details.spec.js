describe('Product details', () => {
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

  it('visits the product detail page of the product that was clicked', () => {
    cy.get('[alt="Giant Tea"]').click()
    cy.contains('.product-detail div h1', 'Giant Tea')
  });
});