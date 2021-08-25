%{ for key, password in passwords ~}
${key + 1}: ${password.result}
%{ endfor ~}