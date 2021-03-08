### Validacion cruzada k-veces en Series de Tiempo
Los metodos potentes y rapidos que usan los algoritmos de ML son usualmente la particion de la base de dataos en dos: entrenamiento (train) y evaluacion (test). Sin embargo, estos metodos no puedes ser aplicados en series de tiempo, debido que estos criterios ignoran la secuencia temporal, el cual es la caracteristica mas importante de las series de tiempo.

En series de tiempo los modelos de ML emplean tecnicas de evaluacion llamados backtesting or hindcasting

#### Por que los metodos clasicos de evaluacion de un modelo ML no son aplicables en Series de Tiempo?
Los metodos clasicos de evaluacion de un modelo de ML asume que las observaciones son independientes del tiempo. Esta consideracion no es cierta en series de tiempo.
En series de tiempo no se pueden aleatoriamente separar las observaciones en observaciones de entrenamiento y evaluacion, sino debemos considerar separaciones de observaciones manteniendo la secuencia de las observaciones.

En el pronóstico de series de tiempo, esta evaluación de modelos sobre datos históricos se denomina backtesting. En algunos dominios de series de tiempo, como la meteorología, esto se denomina predicción retrospectiva, en lugar de predicción.

A continuacion se describen tres metodos de backtest de evaluacion de series de tiempo en ML: Separacion Train-Test, multiple separacion Train-Test, y validacion progresiva.
##### Separacion Train-Test
Esta saparacion de serie de tiempo consiste en establecer un punto de particion de la serie para obtener dos series, la primera serie de entrenamiento (train) antes del punto de particion y la segunda serie de evaluacion (test) despues del punto. Segun la cantidad de observaciones (logitud de la serie) la separacion puede ser de 50-50, 60-40, 70-30 y otro.
##### multiple separacion Train-Test
Consiste en repetir el proceso de separacion de la serie varias veces. La multiple separacion de la serie en Train-test, permitira tener vario pares train-test por tanto hacer el modelo de ML mas robusto.








