class Review
  include Databaseable::InstanceMethods
  extend Databaseable::ClassMethods

  ATTRIBUTES = {
    id: "INTEGER PRIMARY KEY",
    customer_id: "INTEGER",
    restaurant_id: "INTEGER",
    review: "TEXT"
  }

  attr_accessor(*self.public_attributes)
  attr_reader :id



  def customer
    sql = <<-SQL
    SELECT * FROM customers
    WHERE customers.id = ?
    SQL

    self.class.db.execute(sql, self.customer_id).first
  end

  def restaurant
    sql = <<-SQL
    SELECT * FROM restaurants
    WHERE restaurants.id = ?
    SQL

    self.class.db.execute(sql, self.restaurant_id).first
  end

end
