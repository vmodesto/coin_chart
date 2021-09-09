module Quote
  class Api
    def quote_of(currencies, date)
      currencies_converted = currencies.join(",")
      date_converted = date.strftime("%Y-%m-%d")
      begin
        ActiveSupport::JSON.decode(Net::HTTP.get(URI("http://api.currencylayer.com/historical?access_key=f5acb0a7baf8bc7b58b3fe3fdeb16535&date=#{date_converted}&currencies=#{currencies_converted}")))
      rescue Exception => e
        "Erro ao conectar #{e}"
      end
    end

    def quote_last_seven_days(currencies)
      first_day = Date.today - 7.days
      response = []
      while first_day < Date.today do
        response_api = quote_of(currencies, first_day)
        response << set_response_api(response_api)
        first_day += 1
        sleep(2)
      end
      return response
    end

    private
    def set_response_api(response_api)
      date = response_api["date"]
      quotes = response_api["quotes"]
      date_and_quotes = {date: date, quotes: quotes}
      return date_and_quotes
    end
    # 1) refatorar o código que formata a resposta para um novo metodo (Extract Method)
    # 2) adicinar a chamada de método no PriceController para a api e descobrir como passar o parametro para a url. Dica vai no terminal e digita rails routes | grep Price
    # 3) adicionar a rota para o PriceController  no arquivo routes.rb - ver  Railes Guides - Routes https://guides.rubyonrails.org/routing.html
    # 4) tratar erros na api Quote usando begin...rescue. https://blog.appsignal.com/2018/04/10/rescuing-exceptions-in-ruby.html
  end
end



