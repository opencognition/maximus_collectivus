class CreateExpandedAuthorizations < ActiveRecord::Migration
  def change
    execute <<-SQL
      CREATE VIEW expanded_authorizations AS
      SELECT a.id, a.node_id, n.lft, n.rgt, a.role_id, a.user_id FROM authorizations a, nodes n
      WHERE a.group_id is NULL AND a.node_id = n.id
      UNION
      SELECT a.id, a.node_id, n.lft, n.rgt, a.role_id, ug.user_id FROM authorizations a, user_groups ug, nodes n
      WHERE a.group_id = ug.group_id AND a.node_id = n.id
    SQL
  end
end

# SELECT ea.user_id, n.id as node_id, n.describer_id, n.describer_type, n.parent_id, n.lft, n.rgt, n.depth, n.position, n.created_at, n.updated_at
# FROM
#     mc_development.nodes n,
#     mc_development.expanded_authorizations ea,
#     mc_development.users u
# WHERE
#     u.id = ea.user_id
# AND
#     ea.lft <= n.lft
# AND
#     ea.rgt >= n.rgt
