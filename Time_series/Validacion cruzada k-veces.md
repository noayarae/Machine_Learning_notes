## Validacion cruzada k-fold en Series de Tiempo
Los criterios para calibración y validación que usan los algoritmos de ML son usualmente la partición de la base de datos en dos: entrenamiento (train) y evaluación (test). Sin embargo, estos métodos no pueden ser aplicados en series de tiempo debido que estos criterios ignoran la secuencia temporal, lo cual es una característica importante de las series de tiempo. 

En series de tiempo los modelos de ML emplean técnicas de separación de datos llamados **backtesting** or **hindcasting**.

### Por que los métodos clásicos de evaluación (separación) de un modelo ML no son aplicables en Series de Tiempo?
Los métodos clásicos de evaluación de un modelo de ML asume que las observaciones son independientes del tiempo. Esta consideracion no es cierta en series de tiempo.
En series de tiempo no se pueden aleatoriamente separar la data en observaciones de entrenamiento y evaluacion, sino debemos considerar separaciones de observaciones manteniendo la secuencia de las observaciones en el tiempo.

En el pronóstico de series de tiempo, esta evaluación de modelos sobre datos históricos se denomina backtesting. En algunos dominios de series de tiempo, como la meteorología, esto se denomina predicción retrospectiva, en lugar de predicción.

A continuación se describen tres métodos de backtest de evaluación de series de tiempo en ML: Separación Train-Test, múltiple separación Train-Test, y validación progresiva.
#### Separación Train-Test (Train-Test split)
Esta saparación de serie de tiempo consiste en establecer un punto de partición de la serie para obtener dos series, la primera serie de entrenamiento (train) antes del punto de partición y la segunda serie de evaluación (test) después del punto. Según la cantidad de observaciones (logitud de la serie), la separación puede ser de 50%-50%, 60%-40%, 70%-30% y otro.
#### Múltiple separación Train-Test (Múltiple Train-Test splits)
Consiste en repetir el proceso anterior de separación de la serie varias veces. La múltiple separación de la serie en train-test, permite tener varios pares train-test lo que resulta en modelo ML más robusto.
Esta múltiple separación puede hacerse manualmente, repitiendo la separación de la serie en varios puntos; sin embargo, la librería scikit-learn provee una función para esto.
___Continua___
***Continua***

#### Validación progresiva (Walk-forward)
Se debe establecer dos parametros:
- El mínimo número de observaciones. Determina el mínimo número de oservaciones en el modelo de entrenamiento (nmin).
- La ventana de desplazamiento o expansión. Determina si el modelo será entrenado en los datos disponibles o solo en las obsevaciones más recientes.

Estos parametros se procesasn como sigue:
- Empezando del inicio de la serie, se toma mínimo número de observaciones (ventana de entrenamiento) para entrenar el primer modelo de ML (v1, v2,...,v_nmin).
- El modelo hace la predicción del siguiente valor de la serie (es decir del valor v_nmin+1)
- La prediccion es comparada con el valor conocido.
- La ventana se amplia en una unidad y luego se repite el proceso

De este modo, este método considera la ampliacion de la serie de entrenamiento en una unidad de tiempo en cada repetición. Este método toma el nombre de Walk-forward, walk-forward validation o Rolling-window Analysis o Rolling forecast.

Este método genera más modelos de entrenamiento con la desventaja de incrementar el costo computacional. Este método contribuye a un modelo ML mucho més robusto. Se debe prestar atención al ancho de la ventana y al tipo de ventana, estos podrían ajustarse para idear un ancho de prueba de tal forma sea significativamente menos costoso desde el punto de vista computacional.

La validación progresiva de las Series de Tiempo (ST) es el equivalente a la validación cruzada en los modelos estándares de ML. Su uso en ST es muy recomendado.

See here:
https://machinelearningmastery.com/backtest-machine-learning-models-time-series-forecasting/









