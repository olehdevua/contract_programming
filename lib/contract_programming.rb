require "contract_programming/version"

module ContractProgramming
  def contract(method)
    prepend( Module.new do
        private def checklist
          @checklist ||= []
        end

        private def check_it(msg, rez)
          checklist << msg unless rez
          checklist
        end

        define_method method do |*args, &bl|
          pre = "pre_#{method}"; post = "post_#{method}"

          if respond_to? pre, true
            send pre, *args, &bl 
            checklist.each{ |msg| raise ArgumentError, msg }.clear
          end

          result = super *args, &bl

          if respond_to? post, true
            send post, result, &bl
            checklist.each{ |msg| raise ArgumentError, msg }.clear
          end

          result
        end
      end
    )
    method
  end
end
