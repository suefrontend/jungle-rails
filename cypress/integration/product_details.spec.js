/// <reference types="cypress" />

describe("product navigation", () => {
  beforeEach(() => {
    cy.visit("/");
  });

  it("should navigate to the product detail page", () => {
    cy.get("article a").first().click();

    cy.url().should("include", "/products/");
  });
});
