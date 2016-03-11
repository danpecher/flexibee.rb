module Flexibee
  class Node
    ##
    # One node response in detail=full mode
    #
    # {
    # 	id: "2",
		#   lastUpdate: "2015-07-03T09:52:25.048+02:00",
		#   kod: "root",
		#   nazev: "Připojené položky",
		#   nazevA: "",
		#   nazevB: "",
		#   nazevC: "",
		#   strobr: "",
		#   hladina: "2",
		#   poradi: "1",
		#   cesta: "1/1/",
		#   kratkyPopis: "",
		#   klicSlova: "",
		#   popis: "",
		#   txtNad: "",
		#   txtPod: "",
		#   strom: "code:STR_CEN",
		#   strom@ref: "/c/woodies/strom-koren/1.json",
		#   strom@showAs: "STR_CEN: Strom ceníku",
		#   otec: "1",
		#   otec@ref: "/c/woodies/strom/1.json",
		#   otec@showAs: "Strom ceníku"
    # }
    ##
    attr_accessor :id, :updated_at, :code, :name, :level, :order, :route, :short_description,
      :keywords, :description, :tree_ref, :parent_id, :parent_ref, :tree

    def initialize(response)
      @id = response['id'].to_i
      @updated_at = response['lastUpdate']
      @code = response['kod']
      @name = response['nazev']
      @level = response['hladina'].to_i
      @order = response['poradi'].to_i
      @route = response['cesta']
      @short_description = response['kratkyPopis']
      @keywords = response['klicSlova']
      @description = response['popis']
      @tree_ref = response['strom@ref']
      @parent_id = response['otec'].to_i
      @parent_ref = response['otec@ref']
    end

    ##
    # all children of the node
    ##
    def descendants
      tree.nodes.select { |node| node.parent_id == id }
    end

    ##
    # parent of the node
    ##
    def parent
      tree.nodes.select { |node| node.id == parent_id }.first
    end
  end
end
