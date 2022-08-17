require "test_helper"

class ProductReviewsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @product_review = product_reviews(:one)
  end

  test "should get index" do
    get product_reviews_url, as: :json
    assert_response :success
  end

  test "should create product_review" do
    assert_difference('ProductReview.count') do
      post product_reviews_url, params: { product_review: { content: @product_review.content, product_id: @product_review.product_id, rating: @product_review.rating, user_id: @product_review.user_id } }, as: :json
    end

    assert_response 201
  end

  test "should show product_review" do
    get product_review_url(@product_review), as: :json
    assert_response :success
  end

  test "should update product_review" do
    patch product_review_url(@product_review), params: { product_review: { content: @product_review.content, product_id: @product_review.product_id, rating: @product_review.rating, user_id: @product_review.user_id } }, as: :json
    assert_response 200
  end

  test "should destroy product_review" do
    assert_difference('ProductReview.count', -1) do
      delete product_review_url(@product_review), as: :json
    end

    assert_response 204
  end
end
