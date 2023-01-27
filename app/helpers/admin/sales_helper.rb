module Admin::SalesHelper

  def active_sale?
    Sale.active.any?
  end

  def current_sale
    @current_sale = Sale.where("starts_on <= ? AND ends_on >= ?", Date.current, Date.current).first.name
  end

  def current_sale_discount
    @current_sale = Sale.where("starts_on <= ? AND ends_on >= ?", Date.current, Date.current).first.percent_off
  end
end
