package com.alexanderdoma.peruinolvidable.model.mysql;

import com.alexanderdoma.peruinolvidable.config.Connector;
import com.alexanderdoma.peruinolvidable.model.DAOException;
import com.alexanderdoma.peruinolvidable.model.IOrderline;
import com.alexanderdoma.peruinolvidable.model.entity.Order;
import com.alexanderdoma.peruinolvidable.model.entity.Orderline;
import com.alexanderdoma.peruinolvidable.model.entity.Product;
import com.alexanderdoma.peruinolvidable.utilies.MessagesManager;
import com.alexanderdoma.peruinolvidable.utilies.SQLSentencesManager;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class OrderlineDAO implements IOrderline{
    
    private final String GETALL = SQLSentencesManager.getProperty("ORDERLINE.GETALL");
    private final String INSERT = SQLSentencesManager.getProperty("ORDERLINE.INSERT");
    private final String UPDATE = SQLSentencesManager.getProperty("ORDERLINE.UPDATE");
    private final String DELETE = SQLSentencesManager.getProperty("ORDERLINE.DELETE");
    private final String GETBYID = SQLSentencesManager.getProperty("ORDERLINE.GETBYID");
    
    @Override
    public void add(Orderline o) throws DAOException {
        PreparedStatement objPreparedStatement = null;
        ResultSet objResultSet = null;
        try(Connection objConnection = Connector.getInstance().getConnection()) {
            objPreparedStatement = objConnection.prepareStatement(INSERT);
            int i=1;
            objPreparedStatement.setInt(i++, o.getQuantity());
            objPreparedStatement.setDouble(i++, o.getTotal());
            objPreparedStatement.setInt(i++, o.getOrder().getId());
            objPreparedStatement.setInt(i++, o.getProduct().getId());
            objPreparedStatement.executeUpdate();
            objConnection.close();
        } catch (SQLException e) {
            throw new DAOException(MessagesManager.getProperty("DATABASE.ERROR.INSERT") + e.getMessage());
        } finally {
            try {
                if(objResultSet != null) objResultSet.close();
                if(objPreparedStatement != null) objPreparedStatement.close();
            } catch (SQLException ex) {
                throw new DAOException(MessagesManager.getProperty("DATABASE.ERROR.INSERT") + ex.getMessage());
            }
        }
    }

    @Override
    public Orderline update(Orderline o) throws DAOException {
        throw new UnsupportedOperationException("Not supported yet.");
    }

    @Override
    public void delete(int id) throws DAOException {
        PreparedStatement objPreparedStatement = null;
        ResultSet objResultSet = null;
        try(Connection objConnection = Connector.getInstance().getConnection()) {
            objPreparedStatement = objConnection.prepareCall(DELETE);
            objPreparedStatement.setInt(1, id);
            objPreparedStatement.executeUpdate();
            objConnection.close();
        } catch (SQLException e) {
            throw new DAOException(MessagesManager.getProperty("DATABASE.ERROR.DELETE") + e.getMessage());
        } finally {
            try {
                if(objResultSet != null) objResultSet.close();
                if(objPreparedStatement != null) objPreparedStatement.close();
            } catch (SQLException ex) {
                throw new DAOException(MessagesManager.getProperty("DATABASE.ERROR.DELETE") + ex.getMessage());
            }
        }
    }

    @Override
    public List<Orderline> getAll() throws DAOException {
        CallableStatement objCallableStatement = null;
        ResultSet objResultSet = null;
        List<Orderline> objOrderlinesList = new ArrayList<>();
        try(Connection objConnection = Connector.getInstance().getConnection()) {
            objCallableStatement = objConnection.prepareCall(GETALL);
            objCallableStatement.execute();
            objResultSet = objCallableStatement.getResultSet();
            while(objResultSet.next()) {
                objOrderlinesList.add(getObject(objResultSet));
            }
            objConnection.close();
            return objOrderlinesList;
        } catch (SQLException ex) {
            throw new DAOException(MessagesManager.getProperty("DATABASE.ERROR.GETALL") + ex.getMessage());
        } finally {
            try {
                if(objResultSet != null) objResultSet.close();
                if(objCallableStatement != null) objCallableStatement.close();
            } catch (SQLException ex) {
                throw new DAOException(MessagesManager.getProperty("DATABASE.ERROR.GETALL") + ex.getMessage());
            }
        }
    }

    @Override
    public Orderline getById(int id) throws DAOException {
        CallableStatement objCallableStatement = null;
        ResultSet objResultSet = null;
        Orderline objOrderline = null;
        try(Connection objConnection = Connector.getInstance().getConnection()) {
            objCallableStatement = objConnection.prepareCall(GETBYID);
            objCallableStatement.setInt(1, id);
            objCallableStatement.execute();
            objResultSet = objCallableStatement.getResultSet();
            while(objResultSet.next()){
                objOrderline = getObject(objResultSet);           
            }
            objConnection.close();
            return objOrderline;
        } catch (SQLException e) {
            throw new DAOException(MessagesManager.getProperty("DATABASE.ERROR.GETBYID") + e.getMessage()); 
        } finally {
            try {
                if(objResultSet != null) objResultSet.close();
                if(objCallableStatement != null) objCallableStatement.close();
            } catch (SQLException ex) {
                throw new DAOException(MessagesManager.getProperty("DATABASE.ERROR.GETBYID") + ex.getMessage());
            }
        }
    }

    @Override
    public Orderline getObject(ResultSet rs) throws DAOException {
        try {
            Product objProduct = new ProductDAO().getById(rs.getInt("product_id"));
            Order objOrder = new OrderDAO().getById(rs.getInt("order_id"));
            return new Orderline(
                    rs.getInt("orderline_id"),
                    rs.getInt("orderline_quantity"),
                    rs.getDouble("orderline_total"),
                    rs.getTimestamp("orderline_created_at"),
                    objOrder,
                    objProduct
            );
        } catch (SQLException ex) {
            throw new DAOException(ex.getMessage());
        }
    }
}
