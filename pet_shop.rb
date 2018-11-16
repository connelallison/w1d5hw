def pet_shop_name(shop)
  return shop[:name]
end

def total_cash(shop)
  return shop[:admin][:total_cash]
end

def add_or_remove_cash(shop, amount)
  shop[:admin][:total_cash] += amount
end

def pets_sold(shop)
  return shop[:admin][:pets_sold]
end

def increase_pets_sold(shop, amount)
  shop[:admin][:pets_sold] += amount
end

def stock_count(shop)
  return shop[:pets].count()
end

def pets_by_breed(shop, breed)
  return shop[:pets].select() { |pet| pet[:breed] == breed }
end

def find_pet_by_name(shop, name)
  return shop[:pets].detect() { |pet| pet[:name] == name }
end

def remove_pet_by_name(shop, name)
  shop[:pets].each() { |pet| if (pet[:name] == name)
  shop[:pets].delete(pet)
  end }
end

def add_pet_to_stock(shop, pet)
  shop[:pets].push(pet)
end

def customer_cash(customer)
  return customer[:cash]
end

def remove_customer_cash(customer, amount)
  customer[:cash] -= amount
end

def customer_pet_count(customer)
  return customer[:pets].count()
end

def add_pet_to_customer(customer, pet)
  customer[:pets].push(pet)
end

def customer_can_afford_pet(customer, pet)
  return customer[:cash] >= pet[:price]
end

def sell_pet_to_customer(shop, pet, customer)
  if shop[:pets].include?(pet)
    if (customer_can_afford_pet(customer, pet) == true)
      add_pet_to_customer(customer, pet)
      remove_customer_cash(customer, pet[:price])
      add_or_remove_cash(shop, pet[:price])
      increase_pets_sold(shop, 1)
      remove_pet_by_name(shop, pet[:name])
    end
  end
end
