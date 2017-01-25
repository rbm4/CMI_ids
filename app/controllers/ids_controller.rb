class IdsController < ApplicationController
    def save
        eqp = Equipamento.new
        eqp.tipo = params['tipo']
        eqp.descricao = params['descricao']
        eqp.setor = params['setor']
        eqp.responsavel = params['pessoa']
        eqp.save!
        token = Token.new
        token.token = SecureRandom.urlsafe_base64(nil, false)
        token.eqp = eqp.id
        token.save
        @messages = "Token único do equipamento registrado: " + String(token.token) + "<br>ID cadastral: " + String(token.eqp)
    end
end
