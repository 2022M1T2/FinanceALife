extends Node

var numEsc = 0

var money = 0.00
var energy = 100
var hapiness = 100 
var debt = 0.00

var totalSpent = 1000.00 - money

var maxMoney := 1000.00
var maxDebt := 1000.00


const socialIcon = "res://assets/sprites/imgs_cards/img_card_exemplo1.png"
const graphIcon = "res://assets/sprites/imgs_cards/img_card_exemplo2.png"
const walletIcon = "res://assets/sprites/imgs_cards/img_card_exemplo3.png"

# Pre load das cores de fundo de cada card
var transportBackground = preload("res://assets/sprites/fundos_cards/fundo_card2.png")
var funBackground = preload("res://assets/sprites/fundos_cards/fundo_card4.png")
var foodBackground = preload("res://assets/sprites/fundos_cards/fundo_card8.png")
var fallbackBackground = preload("res://assets/sprites/fundos_cards/fundo_card5.png")


var extrato = "Você gastou R$" + str(totalSpent) + "!\nVocê tem R$"+ str(money) + " de dinheiro.\nVocê tem " + str(energy) + " de energia.\nVocê tem " + str(hapiness) + " de felicidade.\nVocê tem R$" + str(debt) + " de dívida.\nVocê tem R$" + str(money)

var firstMonthIntroCards = [
	{
		"cardText": "Parabéns! Você foi aprovado na faculdade! As aulas começam esse mês",
		"icon": socialIcon, 
		"choices": [{"exists": false}, {"exists": false}, {"exists": false}]
	},
	{
		"cardText": "Poxa, muito legal isso. Mas a faculdade é em outra cidade. Vou falar com meus pais.",
		"icon": socialIcon, 
		"choices": [{"exists": false}, {"exists": false}, {"exists": false}]
	},
	{
		"cardText":
		"Filho, seu tio disse que pode te emprestar um dinheiro para a sua mudança, mas ele disse que vai precisar que você o pague até o fim do ano.",
		"icon": socialIcon, 
		"choices": [{"exists": false}, {"exists": false}, {"exists": false}]
	},
	{
		"cardText":
		"Nesse período vamos te dar um pouco de dinheiro por mês, para você se manter lá. Cuidado com o que você gasta.",
		"icon": socialIcon, 
		"choices": [{"exists": false}, {"exists": false}, {"exists": false}]
	},
	# One choice cards && First month cards
	{
		"cardText": "Para chegar na faculdade esse mês...deixa eu abrir o mapa.",
		"icon": socialIcon, 
		"choices": [
			{"exists": false},
			{
				"choiceText": "Chamar uber",
				"money": -500,
				"energy": -50,
				"hapiness": -40,
				"debt": 0,
				"exists": true
			},
			{"exists": false}
		]
	},
	{
		"cardText": "Por que esses lugares são tão caros?",
		"icon": socialIcon, 
		"choices": [{"exists": false}, {"exists": false}, {"exists": false}]
	},
	{
		"cardText": "Agora vamos ver quanto eu gastei nesse mês.",
		"icon": graphIcon, 
		"choices":
		[
			{"exists": false},
			{
				"choiceText": str(extrato),
				"money": -50,
				"energy": -10,
				"hapiness": +15,
				"debt": 0,
				"exists": true
			},
			{"exists": false}
		]
	}
]

var secondMonthCards = [
	# Entry
	{
		"cardText": "Gastei de mais! Assim não vou conseguir quitar minha dívida com meu tio!",
		"icon": "LAZER", 
		"choices": [{"exists": false}, {"exists": false}, {"exists": false}]
	},
	{  # Card 1
		"cardText": "Preciso fazer alguma coisa...",
		"icon": "COMIDA", 
		"choices":
		[
			{
				"choiceText":
				"Vou começar a sair mais cedo de casa para pegar o ônibus que demora pra chegar, mas chegarei direto na faculdade.",
				"money": -350,
				"energy": -10,
				"hapiness": -10,
				"debt": 0,
				"exists": true
			},
			{
				"choiceText":
				"Acho que vou de taxi só quando for muito necessário, como em dias de chuva ou se acordar atrasado.",
				"money": -400,
				"energy": -10,
				"hapiness": 10,
				"debt": 0,
				"exists": true
			},
			{
				"choiceText": "Ah... vou manter como estava no mês passado...",
				"money": -500,
				"energy": -5,
				"hapiness": 0,
				"debt": 0,
				"exists": true
			}
		]
	},
	{
		"cardText": "Detesto pegar esse ônibus lotado... acho que essa decisão é melhor mesmo.",
		"icon": "TEANSPORTE", 
		"choices": [{"exists": false}, {"exists": false}, {"exists": false}]
	},
	{  # Card 2
		"cardText": "Também gastei de mais com comida na faculdade...",
		"icon": graphIcon, 
		"choices":
		[
			{
				"choiceText": "Vou começar a trazer algo feito em casa pra comer então.",
				"money": -300,
				"energy": -30,
				"hapiness": -5,
				"debt": 0,
				"exists": true
			},
			{
				"choiceText": "Vou procurar um restaurante perto da faculdade.",
				"money": -650,
				"energy": +20,
				"hapiness": +25,
				"debt": 0,
				"exists": true
			},
			{
				"choiceText": "Comer? Pra que?",
				"money": 0,
				"energy": -20,
				"hapiness": -20,
				"debt": 0,
				"exists": true
			}
		]
	},
	{
		"cardText": "Pronto, isso deve resolver.",
		"icon": walletIcon, 
		"choices": [{"exists": false}, {"exists": false}, {"exists": false}]
	},
	{  # Card 3
		"cardText": "Mês passado fui a festas todos os sábados...",
		"icon": walletIcon, "choices":
		[
			{
				"choiceText": "Talvez se eu ficar em casa alguns fins de semana...",
				"money": -150,  # ???
				"energy": 30,
				"hapiness": 0,
				"debt": 0,
				"exists": true
			},
			{
				"choiceText": "A vida é muito curta... Quero é aproveitar!",
				"money": -250,
				"energy": -20,
				"hapiness": +10,
				"debt": 0,
				"exists": true
			},
			{
				"choiceText": "Acho vida social desnecessária.",
				"money": 0,
				"energy": 0,
				"hapiness": -30,
				"debt": 0,
				"exists": true
			}
		]
	},
	{
		"cardText": "Certo, agora sim ajustei minhas metas nesse mês!",
		"icon": graphIcon, 
		"choices": [{"exists": false}, {"exists": false}, {"exists": false}]
	},
]


var thirdMonthCards = [
	# Entry
	{
		"cardText": "Um novo mês, novas metas!",
		"icon": socialIcon, 
		"choices": [{"exists": false}, {"exists": false}, {"exists": false}]
	},
	{
		"cardText": "Preciso ir comprar comida no mercado...",
		"icon": socialIcon, 
		"choices": [{"exists": false}, {"exists": false}, {"exists": false}]
	},
	{
		"cardText": "Esse mês vou começar pelos alimentos. Já peguei o frango, a carne. Agora qual arroz eu devo escolher?",
		"icon": socialIcon, 
		"choices":
		[
			{
				"choiceText": "Pacote de 1kg - R$10",
				"money": -400,
				"energy": 0,
				"hapiness": 0,
				"debt": 0,
				"exists": true
			},
			{
				"choiceText": "Pacote de 5kg - R$35",
				"money": -250,
				"energy": 0,
				"hapiness": 0,
				"debt": 0,
				"exists": true
			},
			{
				"choiceText": "Pacote de 500gr - R$5",
				"money": -350,
				"energy": 0,
				"hapiness": 0,
				"debt": 0,
				"exists": true
			}
		]
	},
	{
		"cardText": "Passei pegando algumas frutas, verduras e laticínios, e esqueci de pegar o feijão, eu uso em média o mesmo de arroz.",
		"icon": socialIcon, 
		"choices":
		[
			{
				"choiceText": "Pacote de 1kg - R$9,50",
				"money": -300,
				"energy": 0,
				"hapiness": 0,
				"debt": 0,
				"exists": true
			},
			{
				"choiceText": "Pacote de 5kg - R$59",
				"money": -250,
				"energy": 0,
				"hapiness": 0,
				"debt": 0,
				"exists": true
			},
			{
				"choiceText": "Pacote de 500gr - R$5",
				"money": -350,
				"energy": 0,
				"hapiness": 0,
				"debt": 0,
				"exists": true
			}
		]
	},
	{
		"cardText": "Hum... e um chocolatinho, por que não?",
		"icon": socialIcon, 
		"choices":
		[
			{
				"choiceText": "Chocolate com guaraná",
				"money": -200,
				"energy": 30,
				"hapiness": 0,
				"debt": 0,
				"exists": true
			},
			{
				"choiceText": "Chocolate saboroso",
				"money": -150,
				"energy": 0,
				"hapiness": 30,
				"debt": 0,
				"exists": true
			},
			{
				"choiceText": "Não comprar nenhum",
				"money": 0,
				"energy": 0,
				"hapiness": 0,
				"debt": 0,
				"exists": true
			}
		]
	},
	{
		"cardText": "Agora vou checar os gastos do mês...",
		"icon": walletIcon, 
		"choices": [{"exists": false}, {"exists": false}, {"exists": false}]
	},
]

var fourthMonthCards = [
	# Entry
	{
		"cardText": "Certo, vamos definir minhas metas para o mês...",
		"icon": graphIcon, 
		"choices": [{"exists": false}, {"exists": false}, {"exists": false}]
	},
	{
		"cardText": "Meus amigos na faculdade estão me chamando para um evento de negócios...",
		"icon": socialIcon, 
		"choices":
		[
			{
				"choiceText": "Eu vou, acho que de taxi, para chegar rápido e cedo.",
				"money": -500,
				"energy": 10,
				"hapiness": 10,
				"debt": 0,
				"exists": true
			},
			{"choiceText": "Melhor sair mais cedo, para pegar o onibus e o trem",
				"money": -350,
				"energy": -20,
				"hapiness": -20,
				"debt": 0,
				"exists": true},
			{"exists": false}
		]
	},
	{
		"cardText": "Acho que se eu vou comprar um violão, sempre quis aprender um instrumento novo...",
		"icon": socialIcon, 
		"choices":
		[
			{
				"choiceText": "É, acho que um colega da turma está vendendo um violão velho, quem sabe ela não faz um desconto...",
				"money": -400,
				"energy": 10,
				"hapiness": -30,
				"debt": 0,
				"exists": true
				},
			{"choiceText": "Não, eu gosto mesmo é de tudo novo, vou sair para compra.",
				"money": -500,
				"energy": -30,
				"hapiness": 20,
				"debt": 0,
				"exists": true
				},
			{"exists": false}
		]
	},
	{
		"cardText": "Meus pais virão me visitar esse mês...",
		"icon": socialIcon, 
		"choices":
		[
			{
				"choiceText": "Vou aproveitar e pedir alguns alimentos para alguns dias. Mas espero que eles não pensem que eu passo fome",
				"money": 0,
				"energy": 20,
				"hapiness": -10,
				"debt": 0,
				"exists": true
			},
			{
				"choiceText": "Vou pedir pra trazerem aquele bolo de chocolate que eu gosto.",
				"money": 0,
				"energy": 10,
				"hapiness": 20,
				"debt": 0,
				"exists": true
			},
			{
				"choiceText": "Acho que não vou pedir nada...",
				"money": -300,
				"energy": -20,
				"hapiness": -20,
				"debt": 0,
				"exists": true
			}
		]
	},
	{
		"cardText": "Vai ser bom ter eles por aqui, estou com saudades!",
		"icon": socialIcon, 
		"choices": [{"exists": false}, {"exists": false}, {"exists": false}]
	},
	{
		"cardText": "Agora vamos ver quanto eu consegui economizar dessa vez...",
		"icon": graphIcon, 
		"choices": [{"exists": false}, {"exists": false}, {"exists": false}]
	},
]

# Shown in case the choice of Fourth month card is the second one - 4.2
var fallbackFourTwo = {
	"cardText": "Decisões assim são difíceis, mas essa é a vida.",
	"icon": socialIcon, 
	"choices": [{"exists": false}, {"exists": false}, {"exists": false}]
}

var fifthMonthCards = [
	# Entry
	{
		"cardText":
		"Está chegando o dia de quitar a dívida, e tenho apenas mais dois meses. Por conta da inflação, o mercado ficou mais caro",
		"icon": graphIcon, 
		"choices": [{"exists": false}, {"exists": false}, {"exists": false}]
	},
	{
		"cardText": "Então... agora o que devo comprar no mercado?",
		"icon": walletIcon, 
		"choices":
		[
			{
				"choiceText": "Procurar produtos mais baratos",
				"money": -450,
				"energy": -20,
				"hapiness": -30,
				"debt": 0,
				"exists": true
			},
			{
				"choiceText": "Continuar comprando os mesmos produtos",
				"money": -600,
				"energy": -10,
				"hapiness": -20,
				"debt": 0,
				"exists": true
			},
			{
				"choiceText": "Comprar somente o necessário",
				"money": -300,
				"energy": -30,
				"hapiness": -30,
				"debt": 0,
				"exists": true
			}
		]
	},
	{
		"cardText": "Inflação atrapalha bastante, mas não tem muito o que fazer, só aceitar.",
		"icon": socialIcon, 
		"choices": [{"exists": false}, {"exists": false}, {"exists": false}]
	},
	{
		"cardText":
		"Ihh... preciso encontrar meus amigos no fim de semana, mas o lugar é longe e eu nunca fui lá...",
		"icon": socialIcon, 
		"choices":
		[
			{
				"choiceText": "Ir de táxi",
				"money": -450,
				"energy": -10,
				"hapiness": 15,
				"debt": 0,
				"exists": true
			},
			{
				"choiceText":
				"Calma, eu consigo traçar um caminho pelo mapa! Apenas preciso pegar 3 ônibus e um trem!",
				"money": -350,
				"energy": -40,
				"hapiness": -25,
				"debt": 0,
				"exists": true
			},
			{
				"choiceText":
				"Quer saber... acho que vou ficar em casa mesmo, infelizmente.",
				"money": 0,
				"energy": 20,
				"hapiness": -30,
				"debt": 0,
				"exists": true
			}
		]
	},
	{
		"cardText": "Me falaram que educação financeira é importante para a vida...",
		"icon": graphIcon, 
		"choices":
		[
			{
				"choiceText": "Vou comprar uns livros e cursos para estudar sobre",
				"money": -400,
				"energy": -10,
				"hapiness": 20,
				"debt": 0,
				"exists": true
			},
			{
				"choiceText": "Acho que vou procurar alguns cursos pela internet...",
				"money": -300,
				"energy": 10,
				"hapiness": -35,
				"debt": 0,
				"exists": true
			},
			{
				"choiceText":
				"Ouvir dizer que o Banco Bancário Brasileiro lançou um joguinho sobre isso. Vou testar!",
				"money": 0,
				"energy": 35,
				"hapiness": 35,
				"debt": 0,
				"exists": true
			}
		]
	},
]

var sixthMonthCards = [
	# Entry
	{
		"cardText": "No final desse mês eu preciso quitar a minha dívida!",
		"icon": walletIcon, 
		"choices":
		[
			{
				"choiceText": "Vou ter quer vender meu vídeo game...",
				"money": 200,
				"energy": 10,
				"hapiness": -30,
				"debt": 0,
				"exists": true
			},
			{
				"choiceText": "Acho que falta pouco, vou comprar um lanche então...",
				"money": 100,
				"energy": -30,
				"hapiness": -10,
				"debt": 0,
				"exists": true
			},
			{
				"choiceText": "Ficar sem comer? Acho que dessa vez não dá pra escapar",
				"money": 0,
				"energy": -50,
				"hapiness": -35,
				"debt": 0,
				"exists": true
			}
		]
	},
	{
		"cardText": "Prova?? Verdade! Esqueci de estudar.",
		"icon": socialIcon, 
		"choices":
		[
			{
				"choiceText": "Cadê aquele chocolate com guaraná?",
				"money": 0,
				"energy": 30,
				"hapiness": 20,
				"debt": 0,
				"exists": true
			},
			{
				"choiceText": "Vou confiar no que eu aprendi... eu acho",
				"money": 0,
				"energy": -30,
				"hapiness": -20,
				"debt": 0,
				"exists": true
			},
			{
				"choiceText": "Chamar o táxi para reunir com os amigos e estudar agora mesmo",
				"money": -400,
				"energy": -20,
				"hapiness": 10,
				"debt": 0,
				"exists": true
			}
		]
	},
	{
		"cardText": "Meus amigos querem fazer algo no fim de semana, antes das férias...",
		"icon": socialIcon, 
		"choices":
		[
			{
				"choiceText": "Um passeio no parque? Pelo menos é de graça.",
				"money": 0,
				"energy": -30,
				"hapiness": 20,
				"debt": 0,
				"exists": true
			},
			{
				"choiceText": "Uma última festa, vai... Como nos velhos tempos.",
				"money": -500,
				"energy": -30,
				"hapiness": 30,
				"debt": 0,
				"exists": true
			},
			{
				"choiceText":
				"Acho que dá pra chamar eles aqui em casa e cada um trazer algo e eu preparo a comida.",
				"money": 0,
				"energy": -25,
				"hapiness": 30,
				"debt": 0,
				"exists": true
			}
		]
	},
]

# add all other arrays to the main array
#var cardsArray
var cardsArray1 = []
var cardsArray2 = []
var cardsArray3 = []
var cardsArray4 = []
var cardsArray5 = []
var cardsArray6 = []

# Called when the node enters the scene tree for the first time.
func _ready():
	for i in range(0, len(firstMonthIntroCards)):
		cardsArray1.append(firstMonthIntroCards[i])
	
	for i in range(0, len(secondMonthCards)):
		cardsArray2.append(secondMonthCards[i])
	
	for i in range(0, len(thirdMonthCards)):
		cardsArray3.append(thirdMonthCards[i])
	
	for i in range(0, len(fourthMonthCards)):
		cardsArray4.append(fourthMonthCards[i])
	
	for i in range(0, len(fifthMonthCards)):
		cardsArray5.append(fifthMonthCards[i])
	
	for i in range(0, len(sixthMonthCards)):
		cardsArray6.append(sixthMonthCards[i])
		
	OS.execute("python3", ["csvConverter.py"], true)
	

func _process(delta):
	money = money
	energy = energy
	hapiness = hapiness 
	debt = debt

	totalSpent = totalSpent
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
