class IdsController < ApplicationController
    def save
        eqp = Equipamento.new
        eqp.tipo = params['tipo']
        token = Token.new
        
        partido = String(Date.today.to_time.to_i)
        
        if eqp.tipo == 'computador'
            token.token = "DSK_" + partido
            eqp.descricao = "Registrado como Computador(desktop)"
        elsif eqp.tipo == 'celular'
            token.token = "OTR_" + partido
            eqp.descricao = "Registrado como Computador(desktop)"
        elsif eqp.tipo == 'nobreak'
            token.token = "NBR_" + partido
            eqp.descricao = "Registrado como Nobreak"
        elsif eqp.tipo == "notebook"
            token.token = "NTB_" + partido
            eqp.descricao = "Registrado como Notebook"
        elsif eqp.tipo == "monitor"
            token.token = "MNT_" + partido
            eqp.descricao = "Registrado como Monitor"
        end
        #eqp.save!
        #token.eqp = eqp.id
        #token.save
        @messages = "Token único do equipamento a ser registrado: " + String(token.token) + "<br><h6>O link de acesso ao OTRS está localizado no menu ao lado.</h6>"
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
