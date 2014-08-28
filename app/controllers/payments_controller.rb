class PaymentsController < ApplicationController
  def home; end
  
  def charge_client
    result = Braintree::Transaction.sale(
      :amount => "100.00",
      :payment_method_nonce => params[:payment_method_nonce]
    )
    if result.success? 
      flash[:notice] = "Transaction successful"
      redirect_to root_url
    else
      flash[:danger] = "Transaction error: #{result.transaction.processor_response_text}"
      redirect_to root_url
    end
  end
end