class CreateUserNodes < ActiveRecord::Migration
  def change
    execute <<-SQL
      CREATE VIEW user_nodes AS
      SELECT ea.user_id, n.id, n.describer_id, n.describer_type, n.parent_id, n.lft, n.rgt, n.depth, n.position, n.created_at, n.updated_at
      FROM
        nodes n,
        expanded_authorizations ea,
        users u
      WHERE
        u.id = ea.user_id
      AND
        ((ea.lft <= n.lft AND ea.rgt >= n.rgt) OR (ea.lft >= n.lft AND ea.rgt < n.rgt))
    SQL
  end
end
