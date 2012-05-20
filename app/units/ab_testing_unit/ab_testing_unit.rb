module AbTestingUnit
  include Chanko::Unit

  active_if :always_true

  scope(:view) do
    function(:show_account_provider) do
      provider_name = @current_user.provider
      render :partial => '/show_account_provider', :locals => {:provider_name => provider_name}
    end

    function(:modify_main_message) do
      unless @current_user.provider == 'twitter'
        next run_default
      end
      next render :partial => '/modify_main_message'
    end
  end

=begin
  active_if :always_true do |context, options|
    # "context' is invoking context such as controller
    true
  end

  scope(:controller) do
    function(:show) do
    end
  end

  scope(:view) do
    function(:show) do
      render :partial => "/show"
    end
  end

  models do
    expand("Recipe") do
      def your_method
      end

      class_methods do
        def your_class_method
        end
      end
    end
  end

  shared("your_shared_method") do
    'hello'
  end

  helpers do
    def your_helper_method
    end
  end
=end

end
