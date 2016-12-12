module LosantRest

  # Class containing all the actions for the Solutions Resource
  class Solutions

    def initialize(client)
      @client = client
    end

    # Returns the solutions for the organization
    #
    # Parameters:
    # *  {string} orgId - ID associated with the organization
    # *  {string} sortField - Field to sort the results by. Accepted values are: name, id, creationDate
    # *  {string} sortDirection - Direction to sort the results by. Accepted values are: asc, desc
    # *  {string} page - Which page of results to return
    # *  {string} perPage - How many items to return per page
    # *  {string} filterField - Field to filter the results by. Blank or not provided means no filtering. Accepted values are: name
    # *  {string} filter - Filter to apply against the filtered field. Supports globbing. Blank or not provided means no filtering.
    # *  {string} losantdomain - Domain scope of request (rarely needed)
    # *  {boolean} _actions - Return resource actions in response
    # *  {boolean} _links - Return resource link in response
    # *  {boolean} _embedded - Return embedded resources in response
    #
    # Responses:
    # *  200 - Collection of solutions (https://api.losant.com/#/definitions/solutions)
    #
    # Errors:
    # *  400 - Error if malformed request (https://api.losant.com/#/definitions/error)
    def get(params = {})
      params = Utils.symbolize_hash_keys(params)
      query_params = { _actions: false, _links: true, _embedded: true }
      headers = {}
      body = nil

      raise ArgumentError.new("orgId is required") unless params.has_key?(:orgId)

      query_params[:sortField] = params[:sortField] if params.has_key?(:sortField)
      query_params[:sortDirection] = params[:sortDirection] if params.has_key?(:sortDirection)
      query_params[:page] = params[:page] if params.has_key?(:page)
      query_params[:perPage] = params[:perPage] if params.has_key?(:perPage)
      query_params[:filterField] = params[:filterField] if params.has_key?(:filterField)
      query_params[:filter] = params[:filter] if params.has_key?(:filter)
      headers[:losantdomain] = params[:losantdomain] if params.has_key?(:losantdomain)
      query_params[:_actions] = params[:_actions] if params.has_key?(:_actions)
      query_params[:_links] = params[:_links] if params.has_key?(:_links)
      query_params[:_embedded] = params[:_embedded] if params.has_key?(:_embedded)

      path = "/orgs/#{params[:orgId]}/solutions"

      @client.request(
        method: :get,
        path: path,
        query: query_params,
        headers: headers,
        body: body)
    end

    # Create a new solution
    #
    # Parameters:
    # *  {string} orgId - ID associated with the organization
    # *  {hash} solution - New solution information (https://api.losant.com/#/definitions/solutionPost)
    # *  {string} losantdomain - Domain scope of request (rarely needed)
    # *  {boolean} _actions - Return resource actions in response
    # *  {boolean} _links - Return resource link in response
    # *  {boolean} _embedded - Return embedded resources in response
    #
    # Responses:
    # *  201 - Successfully created solution (https://api.losant.com/#/definitions/solution)
    #
    # Errors:
    # *  400 - Error if malformed request (https://api.losant.com/#/definitions/error)
    def post(params = {})
      params = Utils.symbolize_hash_keys(params)
      query_params = { _actions: false, _links: true, _embedded: true }
      headers = {}
      body = nil

      raise ArgumentError.new("orgId is required") unless params.has_key?(:orgId)
      raise ArgumentError.new("solution is required") unless params.has_key?(:solution)

      body = params[:solution] if params.has_key?(:solution)
      headers[:losantdomain] = params[:losantdomain] if params.has_key?(:losantdomain)
      query_params[:_actions] = params[:_actions] if params.has_key?(:_actions)
      query_params[:_links] = params[:_links] if params.has_key?(:_links)
      query_params[:_embedded] = params[:_embedded] if params.has_key?(:_embedded)

      path = "/orgs/#{params[:orgId]}/solutions"

      @client.request(
        method: :post,
        path: path,
        query: query_params,
        headers: headers,
        body: body)
    end

  end
end