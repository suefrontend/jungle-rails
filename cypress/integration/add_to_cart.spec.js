/// <reference types="cypress" />

describe("product navigation", () => {
  beforeEach(() => {
    cy.visit("/");
  });

  it("should add item to cart when Add to Cart button is clicked", () => {
    cy.get("nav").contains("My Cart (0)");

    cy.get(".btn").contains("Add").click({ force: true });

    cy.get("nav").contains("My Cart (1)");
  });
});
