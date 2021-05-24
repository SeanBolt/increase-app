class IncreaseService
  BASE_REQUEST = HTTP.auth("Bearer " + ENV['BEARER_TOKEN'])

  def list_accounts
    get("/accounts")
  end

  def list_account(account_id)
    get("/accounts/" + account_id)
  end

  def list_transfers
    get("/transfers")["data"]
  end

  def list_transfer(transfer_id)
    get("/transfers/achs/" +transfer_id)
  end

  def list_entities
    get("/entities")
  end

  def list_entity(entity_id)
    get("/entities/" + entity_id)
  end

  def create_ach_transfer(account_id, amount, account_number, routing_number, statement_descriptor)
    data = {
      account_id: account_id,
      amount: amount,
      account_number: account_number,
      routing_number: routing_number,
      statement_descriptor: statement_descriptor
    }

    post('/transfers/achs', data)
  end

  private

  def get(path)
    full_path = ENV['INCREASE_BASE_URL'] + path
    JSON.parse(BASE_REQUEST.get(full_path).to_s)
  end

  def post(path, data)
    full_path = ENV['INCREASE_BASE_URL'] + path
    JSON.parse(BASE_REQUEST.post(full_path, json: data).to_s)
  end
end
