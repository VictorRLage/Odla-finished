var database = require("../database/config");

function buscarUltimasMedidas(idAquario, limite_linhas) {
    
    instrucaoSql = ''
    
    if (process.env.AMBIENTE_PROCESSO == "producao") {
        instrucaoSql = `select top (7) Lux, FORMAT(dataHora,'hh:mm') as momento, fkSensor from VerificacaoHora where fkSensor = 1 order by idVerificacaoHora desc`;

    } else if (process.env.AMBIENTE_PROCESSO == "desenvolvimento") {
        instrucaoSql = `select Lux, DATE_FORMAT(dataHora,'%H:%i') as momento, fkSensor from VerificacaoHora where fkSensor = 1 order by idVerificacaoHora desc limit  ${limite_linhas}`;
        
    } else {
        console.log("\nO AMBIENTE (produção OU desenvolvimento) NÃO FOI DEFINIDO EM app.js\n");
        return
    }
    
    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}

function buscarMedidasEmTempoReal(idAquario) {
    
    instrucaoSql = ''
    
    if (process.env.AMBIENTE_PROCESSO == "producao") {       
        instrucaoSql = `select top (1) Lux, FORMAT(dataHora,'hh:mm') as momento, fkSensor from VerificacaoHora where fkSensor = 1 order by idVerificacaoHora desc`;
        
    } else if (process.env.AMBIENTE_PROCESSO == "desenvolvimento") {
        instrucaoSql = `select Lux, DATE_FORMAT(dataHora,'%H:%i') as momento, fkSensor from VerificacaoHora where fkSensor = 1 order by idVerificacaoHora  desc limit 1;`;
    } else {
        console.log("\nO AMBIENTE (produção OU desenvolvimento) NÃO FOI DEFINIDO EM app.js\n");
        return
    }

    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}


module.exports = {
    buscarUltimasMedidas,
    buscarMedidasEmTempoReal
}
