# Acme Widget Co

## Features

- Products with codes and prices
- Configurable delivery charge rules (tiered pricing)
- Special offers (e.g. **buy 1 Red Widget, get 2nd half price**)
- Basket with product addition and total calculation
- Printer to display multiple baskets in a tabular format
- Extensible design for adding more offers or delivery strategies

---

## Design Concepts

### 1. Good Separation / Encapsulation of Concerns
- **Product**, **DeliveryRule**, **Offer**, **Basket**, and **Printer** each have **one responsibility**.
- Example: `Basket` manages items and totals, while `BasketPrinter` only handles presentation.

### 2. Small, Accurate Interfaces / Classes
- Each class exposes only what’s needed:
  - `Basket#add` → add products by code  
  - `Basket#total` → calculate basket total  
  - `Offer#apply_discount` → compute discount for eligible items  

This keeps interfaces focused and easy to understand.

### 3. Dependency Injection
- `Basket` does not hardcode delivery logic or offers.
- Instead, it accepts `product_catalogue`, `delivery_rule`, and `offers` as injected dependencies.
- This makes it easy to swap in new rules or offers without changing basket implementation.

### 4. Strategy Pattern / Extensible Code
- Offers follow the **Strategy pattern**:
  - `Offer` is the abstract base.
  - `BuyXGetNthHalf` implements a specific promotion (e.g. “buy 1 get 2nd half price”).
- Adding a new promotion = just implement another `Offer` subclass, no changes to the basket.

### 5. Source Control, Conventional / Meaningful Commits
- Development was done with **feature branches** and **pull requests**.
- Branches can be viewed here: [Project Branches](https://github.com/pro-dev-azan/acme_widget/branches)
- Closed pull requests (merged features and fixes) are here: [Project Pull Requests](https://github.com/pro-dev-azan/acme_widget/pulls?q=is%3Apr+is%3Aclosed)
- This ensures a clear history and easy tracking of changes.

### 6. Output as per expectations:
- <img width="443" height="162" alt="image" src="https://github.com/user-attachments/assets/a056fb73-e5de-48b0-b668-27e4fe5f71f6" />

---

## 🛠️ Example Usage

```ruby
basket = Basket.new(product_catalog: product_catalog, delivery_rules: delivery_rules, offers: offers)
basket.add("R01")
basket.add("R01")
puts basket.total  # => 54.37
```
