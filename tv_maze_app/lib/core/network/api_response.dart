class ApiResponse<T> {
  final T? data;
  final Exception? error;

  ApiResponse.success(this.data) : error = null;
  ApiResponse.failure(this.error) : data = null;
}
