library(keras)

mnist <- dataset_mnist()

x_train <- mnist$train$x
y_train <- mnist$train$y
x_test <- mnist$test$x
y_test <- mnist$test$y
storage.mode(x_train) <- "double"
storage.mode(x_test) <- "double"

y_train <- to_categorical(y_train, 10)
y_test <- to_categorical(y_test, 10)

mnist_cnn <- keras_model_sequential() %>%
  layer_reshape(target_shape = c(28, 28, 1), input_shape = c(28, 28)) %>%
  layer_lambda(function(x) x / 256) %>%
  layer_conv_2d(filters = 32, kernel_size = c(3, 3), activation = "relu") %>%
  layer_conv_2d(filters = 16, kernel_size = c(3, 3), activation = "relu") %>%
  layer_max_pooling_2d(pool_size = c(2, 2)) %>%
  layer_dropout(rate = 0.25) %>%
  layer_flatten() %>%
  layer_dense(units = 64, activation = "relu") %>%
  layer_dropout(rate = 0.5) %>%
  layer_dense(units = 10, activation = "softmax")

mnist_cnn %>% compile(
  loss = loss_categorical_crossentropy,
  optimizer = optimizer_adadelta(),
  metrics = c("accuracy")
)

mnist_cnn %>% fit(
  x_train, y_train,
  batch_size = 128,
  epochs = 30, # for testing
  validation_split = 0.2
)

mnist_cnn %>% save_model_weights_hdf5("weights.h5")


pred <- mnist_model %>% predict_classes(x_test)
wrong_idx <- which(pred != mnist$test$y)

par(mfrow = c(5, 5), mar = c(0, 0, 0, 0))
for (i in seq_along(wrong_idx)) plot_mnist(mnist$test, wrong_idx[i])
