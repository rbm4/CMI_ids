class IdsController < ApplicationController
    def save
        eqp = Equipamento.new
        eqp.tipo = params['tipo']
        token = Token.new
        j = SecureRandom.random_number
        js = String(j).split(".")
        token.token = js[1]
        partido = token.token.slice(1..10)
        if eqp.tipo == 'computador'
            token.token = "DSK_" + partido
        elsif eqp.tipo == 'celular'
            token.token = "OTR_" + partido
        elsif eqp.tipo == 'nobreak'
            token.token = "NBR_" + partido
        elsif eqp.tipo == "notebook"
            token.token = "NTB_" + partido
        elsif eqp.tipo == "monitor"
            token.token = "MNT_" + partido
        end
        token.eqp = eqp.id
        token.save
        @messages = "Token único do equipamento registrado: " + String(token.token) + "<br>ID cadastral: " + String(token.eqp) + "<br><h6>Para procurar o equipamento e obter informações dele, utilize o menu 'consulta' ao lado.</h6>"
    end
    def ajuda
        #ajuda form
    end
    def sobre
        #página explicativa
    end
    def search
        @search = params['search']
        if params['search'] != nil
            @content = true
            puts 'asdasdads'
            if tok = Token.find_by_token(params['search'])
                @exists = true
                @eqp = Equipamento.find_by_id(tok.eqp)
            else
                @exists = false
            end
        end
    end
end
